insert into people (location_id) Select id FROM contacts;
UPDATE people,contacts
Set
people.FirstName=contacts.FirstName,
people.LastName=contacts.LastName,
people.Title=contacts.Title,
people.MobilePhone=contacts.MobilePhone,
people.EmailName=contacts.EmailName
where people.location_id=contacts.id;
UPDATE people,locations
Set
people.location_id=locations.id
where people.location_id=locations.contact_id;