USE DataWarehouse
GO

INSERT INTO Junk (junk_id, status_, wasReturnedOnWarranty) VALUES
	('45a7ae0b-a971-4d5a-95c8-26f5da135c8b', 'Rejected', 'No'),
	('89c9a684-ef3a-4116-bde9-caed1dddbf3f', 'Replaced', 'Yes')

INSERT INTO Material (material_id, material_name, material_type) VALUES
	('7b7264cf-2640-4074-b378-ffb49e6e27ed', 'Wood Venire', 'Wood'),
	('715e1229-b050-42e0-9b93-6b20babb0dd9', 'Steel', 'Metal')

INSERT INTO Employee (employee_id, name_, career_stage, age) VALUES
    ('08d36237-205f-441f-ae5f-c6a91e4f33e0', 'Adam Racek', 'intern', 30),
    ('08d36237-205f-441f-ae5f-c6a91e4f33e1', 'Adam Reck', 'intermediate', 20)

INSERT INTO Date_ (date_, year_, month_, monthNumber, day_, dayOfWeek_, DayOfWeekNumber) VALUES
    ('2024-01-17 10:22', 2024, 'January', 11, 7, 'Sunday', 7),
    ('2024-05-17 13:22', 2024, 'February', 12, 7, 'Sunday', 7),
	('2024-10-17 14:22', 2024, 'February', 12, 7, 'Sunday', 7)

INSERT INTO ProductCatalogue (productCatalogue_id, name_, material_id, catalogue_price, category, introduction_date, insertion_date, deactivation_date) VALUES
	('0ed33e11-aa79-4412-98a4-2043bee00734', 'guitar', '7b7264cf-2640-4074-b378-ffb49e6e27ed', 400, 'instruments', '2024-01-17 10:22', '2024-05-17 13:22', '2024-10-17 14:22'),
	('21ed4f7b-f13d-46b6-93a9-649fe2a1bf2c', 'table', '715e1229-b050-42e0-9b93-6b20babb0dd9', 1000, 'kitchen', '2024-01-17 10:22', '2024-05-17 13:22', '2024-10-17 14:22')

INSERT INTO Products (products_id, productCatalogue_id, serial_number) VALUES
    ('a2ad117b-37c5-4c8d-8d95-4df2b820f90d', '0ed33e11-aa79-4412-98a4-2043bee00734', 1),
    ('10467807-1e56-46d0-8644-6fbc42a75559', '21ed4f7b-f13d-46b6-93a9-649fe2a1bf2c', 2)

INSERT INTO Returns_ (returns_id, company_cost, processing_time_days, days_since_purchase, products_id, junk_id, processing_started_id, processing_finished_id) VALUES
	('807c496e-d770-4bfa-8083-81689b90fdad', 100, 100, 123, 'a2ad117b-37c5-4c8d-8d95-4df2b820f90d', '45a7ae0b-a971-4d5a-95c8-26f5da135c8b', '08d36237-205f-441f-ae5f-c6a91e4f32e6', '08d36237-205f-441f-ae5f-c6a91e4f32e6'),
	('6e93ebab-6e89-45f3-a9b3-fcac6d48299d', 200, 200, 123, 'a2ad117b-37c5-4c8d-8d95-4df2b820f90d', '89c9a684-ef3a-4116-bde9-caed1dddbf3f', '08d36237-205f-441f-ae5f-c6a91e4f32e6', '08d36237-205f-441f-ae5f-c6a91e4f32e6')
	--('807c496e-d770-4bfa-8083-81689b90fdad', 100, 100, 123, 'a2ad117b-37c5-4c8d-8d95-4df2b820f90d', '45a7ae0b-a971-4d5a-95c8-26f5da135c8b', '2024-12-01 12:00:00', '2024-12-01 12:00:00'),
    --('6e93ebab-6e89-45f3-a9b3-fcac6d48299d', 200, 200, 123, 'a2ad117b-37c5-4c8d-8d95-4df2b820f90d', '89c9a684-ef3a-4116-bde9-caed1dddbf3f', '2024-12-02 15:00:00', '2024-12-02 15:00:00')

INSERT INTO ProductSales (products_id, price, discount_applied, date_id) VALUES
    ('a2ad117b-37c5-4c8d-8d95-4df2b820f90d', 123, 10, '2024-01-17 10:22'),
    ('10467807-1e56-46d0-8644-6fbc42a75559', 323, 20, '2024-01-17 10:22')

INSERT INTO ReturnProcessing (employee_id, returns_id) VALUES
    ('08d36237-205f-441f-ae5f-c6a91e4f33e0', '807c496e-d770-4bfa-8083-81689b90fdad'),
    ('08d36237-205f-441f-ae5f-c6a91e4f33e1', '6e93ebab-6e89-45f3-a9b3-fcac6d48299d')
