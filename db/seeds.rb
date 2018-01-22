# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bosses = Group.create(name: 'Geschäftsleitung')
mitarbeiter = Group.create(name: 'Mitarbeiter')
pdc = Group.create(name: 'PDC')

User.create(name: 'Manuel Sabatino', admin: true, group_id: bosses.id,
						email: 'msa@pdc-salespitcher.ch', password: 'manuel', password_confirmation: 'manuel')

User.create(name: 'Riccardo Muzzi', admin: true, group_id: bosses.id,
						email: 'rmu@pdc-salespitcher.ch', password: 'riccardo', password_confirmation: 'riccardo')

User.create(name: 'Laura', admin: false, group_id: mitarbeiter.id,
						email: 'laura@pdc-salespitcher.ch', password: 'laura', password_confirmation: 'laura')

User.create(name: 'Hilke', admin: false, group_id: mitarbeiter.id,
						email: 'hilkeros@gmail.com', password: 'hilke', password_confirmation: 'hilke')

User.create(name: 'Martina Rykert', admin: false, group_id: pdc.id,
						email: 'mrykart@pdc-salespitcher.ch', password: 'martina', password_confirmation: 'martina')
User.create(name: 'Stefan Isliker', admin: false, group_id: pdc.id,
						email: 'sisliker@pdc-online.com', password: 'stefan', password_confirmation: 'stefan')
