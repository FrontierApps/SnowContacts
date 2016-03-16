insert into people (contact_id) Select id FROM contacts;
UPDATE people,contacts,locations
Set
people.FirstName=contacts.FirstName,
people.LastName=contacts.LastName,
people.Title=contacts.Title,
people.MobilePhone=contacts.MobilePhone,
people.EmailName=contacts.EmailName
where people.contact_id=contacts.id;
UPDATE people,locations
Set
people.location_id=locations.id
where people.contact_id=locations.locationName;
UPDATE locations
Set
locations.locationName=null;