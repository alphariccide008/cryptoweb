import random,string,os
import json,requests
from functools import wraps

from flask import render_template,request,abort,redirect,flash,make_response,session,url_for,jsonify
from sqlalchemy.sql import text
from werkzeug.security import generate_password_hash, check_password_hash


from pkg import app,csrf
from pkg.models import db,User,Adminreg,Transaction,Balance
from pkg.forms import *





#This is a decoratoer to help check if there is a user logged in
def login_required(f):
    @wraps(f)
    def login_check(*args,**kwargs):
        if session.get('admin') !=None:
            return f(*args,**kwargs)
        else:
            flash('Access Denied')
            flash('You must be logged in first')
            return redirect('/admin/')
    return login_check




@app.route("/admin/",methods=["POST","GET"])
def admin():
    if request.method =="GET":
        return render_template('admin/adminlog.html')
    else:
        username = request.form.get('email')
        pwd =request.form.get('pwd')
        deets = db.session.query(Adminreg).filter(Adminreg.admin_username==username).first()
        if deets != None:
            hashed_pwd =deets.admin_pwd

            if check_password_hash(hashed_pwd,pwd)==True:
                session['admin']=deets.admin_id

                return redirect(url_for('all_users'))
            else:
                flash('invalid credentials, try again',category='error')
                return redirect('/admin/')
        else:
            flash('invalid Credentials, try again',category='error')
            return redirect('/admin/')
        




@app.route('/all_users/')
@login_required
def all_users():
    id = session.get('admin')
    admindeets = db.session.query(Adminreg).get_or_404(id)
    userdeets = db.session.query(User,Balance).join(Balance, User.user_id==Balance.balance_user_id).all()
    deet =[{'user':user ,'bala': bala} for user,bala in userdeets]
    return render_template('admin/all_user.html',deets=deet)


@app.route("/All_transactions")
@login_required
def all_transaction():
    id = session.get('admin')
    admindeets = db.session.query(Adminreg).get_or_404(id)
    userdeets = db.session.query(User,Transaction).join(Transaction, User.user_id==Transaction.trans_user_id).all()
    deet = [{'user':user, 'trans': trans}for user ,trans in userdeets ]
    return render_template('admin/transactions.html',admindeets=admindeets ,deets=deet)




@app.route('/edit_balance/<di>', methods=['POST', 'GET'])
@login_required
def edit_balance(di):
    if request.method == 'POST':
        btc_balance = request.form.get('btcbalance')
        eth_balance = request.form.get('ethbalance')
        freezed_balance = request.form.get('freezed')

        balance = db.session.query(Balance).filter_by(balance_user_id=di).first()
        if balance:
            balance.btc_balance = btc_balance
            balance.eth_balance = eth_balance
            balance.freezed_balance = freezed_balance
            db.session.commit()
            flash('Balance updated successfully', category='success')
        else:
            flash('Balance not found', category='error')

        return redirect(url_for('all_users'))

    id = session.get('admin')
    userdeet = db.session.query(Adminreg).get_or_404(id)
    deets = db.session.query(Balance).filter_by(balance_user_id=di).first()
    return render_template('admin/editbalance.html', userdeet=userdeet, deets=deets)



  
    
    





@app.route("/admin/delete/<id>/" ,methods=['POST','GET'])
def all_delete(id):
    payment = db.session.query(User).get_or_404(id)
    balance = db.session.query(Balance).filter_by(balance_user_id=id)
    transaction =db.session.query(Transaction).filter_by(trans_user_id=id)
    db.session.delete(payment)
   
    db.session.commit()
    flash('payments has been deleted Successfully',category='paymentmsg')
    return redirect(url_for('all_users'))


@app.route("/admin/confrim/<id>/")
def confirm(id):
    transaction =db.session.query(Transaction).get_or_404(id)
    transaction.trans_status='Confirmed'
    db.session.commit()
    flash('Payment has been successfully confirmed',category='success')
    return redirect(url_for('all_transaction'))