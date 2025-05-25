-- Cleanup existing data and reseed identities

ALTER TABLE Order_Items NOCHECK CONSTRAINT ALL;

ALTER TABLE Orders NOCHECK CONSTRAINT ALL;

ALTER TABLE Products NOCHECK CONSTRAINT ALL;

ALTER TABLE Users NOCHECK CONSTRAINT ALL;

ALTER TABLE Organizations NOCHECK CONSTRAINT ALL;

DELETE FROM Order_Items;

DELETE FROM Orders;

DELETE FROM Products;

DELETE FROM Users;

DELETE FROM Organizations;

DBCC CHECKIDENT ('Order_Items', RESEED, 0);

DBCC CHECKIDENT ('Orders', RESEED, 0);

DBCC CHECKIDENT ('Products', RESEED, 0);

DBCC CHECKIDENT ('Users', RESEED, 0);

DBCC CHECKIDENT ('Organizations', RESEED, 0);

ALTER TABLE Order_Items CHECK CONSTRAINT ALL;

ALTER TABLE Orders CHECK CONSTRAINT ALL;

ALTER TABLE Products CHECK CONSTRAINT ALL;

ALTER TABLE Users CHECK CONSTRAINT ALL;

ALTER TABLE Organizations CHECK CONSTRAINT ALL;

SET IDENTITY_INSERT [dbo].[organizations] ON;

INSERT INTO organizations (id, name, image_url) VALUES (1, N'AAST', 'https://picsum.photos/seed/org1/200');

INSERT INTO organizations (id, name, image_url) VALUES (2, N'Cairo University', 'https://picsum.photos/seed/org2/200');

INSERT INTO organizations (id, name, image_url) VALUES (3, N'Alex University', 'https://picsum.photos/seed/org3/200');

INSERT INTO organizations (id, name, image_url) VALUES (4, N'Helwan University', 'https://picsum.photos/seed/org4/200');

INSERT INTO organizations (id, name, image_url) VALUES (5, N'GUC', 'https://picsum.photos/seed/org5/200');

INSERT INTO organizations (id, name, image_url) VALUES (6, N'AUC', 'https://picsum.photos/seed/org6/200');

SET IDENTITY_INSERT [dbo].[organizations] OFF;


SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (1, N'user_1_1', 'user1@example.com', 'creator', GETDATE(), 'hashed_pw_1', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (2, N'user_1_2', 'user2@example.com', 'pending_creator', GETDATE(), 'hashed_pw_2', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (3, N'user_1_3', 'user3@example.com', 'admin', GETDATE(), 'hashed_pw_3', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (4, N'user_1_4', 'user4@example.com', 'creator', GETDATE(), 'hashed_pw_4', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (5, N'user_1_5', 'user5@example.com', 'student', GETDATE(), 'hashed_pw_5', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (6, N'user_1_6', 'user6@example.com', 'creator', GETDATE(), 'hashed_pw_6', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (7, N'user_1_7', 'user7@example.com', 'creator', GETDATE(), 'hashed_pw_7', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (8, N'user_1_8', 'user8@example.com', 'creator', GETDATE(), 'hashed_pw_8', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (9, N'user_1_9', 'user9@example.com', 'student', GETDATE(), 'hashed_pw_9', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (10, N'user_1_10', 'user10@example.com', 'creator', GETDATE(), 'hashed_pw_10', 1, 1);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (11, N'user_2_1', 'user11@example.com', 'student', GETDATE(), 'hashed_pw_11', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (12, N'user_2_2', 'user12@example.com', 'creator', GETDATE(), 'hashed_pw_12', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (13, N'user_2_3', 'user13@example.com', 'creator', GETDATE(), 'hashed_pw_13', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (14, N'user_2_4', 'user14@example.com', 'creator', GETDATE(), 'hashed_pw_14', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (15, N'user_2_5', 'user15@example.com', 'creator', GETDATE(), 'hashed_pw_15', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (16, N'user_2_6', 'user16@example.com', 'student', GETDATE(), 'hashed_pw_16', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (17, N'user_2_7', 'user17@example.com', 'creator', GETDATE(), 'hashed_pw_17', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (18, N'user_2_8', 'user18@example.com', 'pending_creator', GETDATE(), 'hashed_pw_18', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (19, N'user_2_9', 'user19@example.com', 'student', GETDATE(), 'hashed_pw_19', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (20, N'user_2_10', 'user20@example.com', 'student', GETDATE(), 'hashed_pw_20', 1, 2);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (21, N'user_3_1', 'user21@example.com', 'pending_creator', GETDATE(), 'hashed_pw_21', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (22, N'user_3_2', 'user22@example.com', 'creator', GETDATE(), 'hashed_pw_22', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (23, N'user_3_3', 'user23@example.com', 'student', GETDATE(), 'hashed_pw_23', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (24, N'user_3_4', 'user24@example.com', 'student', GETDATE(), 'hashed_pw_24', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (25, N'user_3_5', 'user25@example.com', 'creator', GETDATE(), 'hashed_pw_25', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (26, N'user_3_6', 'user26@example.com', 'pending_creator', GETDATE(), 'hashed_pw_26', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (27, N'user_3_7', 'user27@example.com', 'creator', GETDATE(), 'hashed_pw_27', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (28, N'user_3_8', 'user28@example.com', 'creator', GETDATE(), 'hashed_pw_28', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (29, N'user_3_9', 'user29@example.com', 'creator', GETDATE(), 'hashed_pw_29', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (30, N'user_3_10', 'user30@example.com', 'student', GETDATE(), 'hashed_pw_30', 1, 3);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (31, N'user_4_1', 'user31@example.com', 'student', GETDATE(), 'hashed_pw_31', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (32, N'user_4_2', 'user32@example.com', 'pending_creator', GETDATE(), 'hashed_pw_32', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (33, N'user_4_3', 'user33@example.com', 'admin', GETDATE(), 'hashed_pw_33', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (34, N'user_4_4', 'user34@example.com', 'student', GETDATE(), 'hashed_pw_34', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (35, N'user_4_5', 'user35@example.com', 'creator', GETDATE(), 'hashed_pw_35', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (36, N'user_4_6', 'user36@example.com', 'admin', GETDATE(), 'hashed_pw_36', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (37, N'user_4_7', 'user37@example.com', 'student', GETDATE(), 'hashed_pw_37', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (38, N'user_4_8', 'user38@example.com', 'creator', GETDATE(), 'hashed_pw_38', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (39, N'user_4_9', 'user39@example.com', 'creator', GETDATE(), 'hashed_pw_39', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (40, N'user_4_10', 'user40@example.com', 'student', GETDATE(), 'hashed_pw_40', 1, 4);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (41, N'user_5_1', 'user41@example.com', 'creator', GETDATE(), 'hashed_pw_41', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (42, N'user_5_2', 'user42@example.com', 'admin', GETDATE(), 'hashed_pw_42', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (43, N'user_5_3', 'user43@example.com', 'pending_creator', GETDATE(), 'hashed_pw_43', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (44, N'user_5_4', 'user44@example.com', 'pending_creator', GETDATE(), 'hashed_pw_44', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (45, N'user_5_5', 'user45@example.com', 'creator', GETDATE(), 'hashed_pw_45', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (46, N'user_5_6', 'user46@example.com', 'creator', GETDATE(), 'hashed_pw_46', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (47, N'user_5_7', 'user47@example.com', 'creator', GETDATE(), 'hashed_pw_47', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (48, N'user_5_8', 'user48@example.com', 'student', GETDATE(), 'hashed_pw_48', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (49, N'user_5_9', 'user49@example.com', 'pending_creator', GETDATE(), 'hashed_pw_49', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (50, N'user_5_10', 'user50@example.com', 'student', GETDATE(), 'hashed_pw_50', 1, 5);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (51, N'user_6_1', 'user51@example.com', 'admin', GETDATE(), 'hashed_pw_51', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (52, N'user_6_2', 'user52@example.com', 'creator', GETDATE(), 'hashed_pw_52', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (53, N'user_6_3', 'user53@example.com', 'student', GETDATE(), 'hashed_pw_53', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (54, N'user_6_4', 'user54@example.com', 'creator', GETDATE(), 'hashed_pw_54', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (55, N'user_6_5', 'user55@example.com', 'admin', GETDATE(), 'hashed_pw_55', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (56, N'user_6_6', 'user56@example.com', 'student', GETDATE(), 'hashed_pw_56', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (57, N'user_6_7', 'user57@example.com', 'creator', GETDATE(), 'hashed_pw_57', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (58, N'user_6_8', 'user58@example.com', 'pending_creator', GETDATE(), 'hashed_pw_58', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (59, N'user_6_9', 'user59@example.com', 'student', GETDATE(), 'hashed_pw_59', 1, 6);

INSERT INTO Users (id, username, email, role, created_at, hashed_password, is_active, organization_id) VALUES (60, N'user_6_10', 'user60@example.com', 'creator', GETDATE(), 'hashed_pw_60', 1, 6);

SET IDENTITY_INSERT [dbo].[Users] OFF;


SET IDENTITY_INSERT [dbo].[Products] ON;

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (1, N'Upgradable responsive collaboration', N'Laudantium aperiam dolores. Dolorem omnis architecto. Exercitationem optio consequatur ullam.', N'Data Structures', 15.49, 'https://notawise.com/files/sample_1.pdf', GETDATE(), 'user_1_6', 1, 'https://picsum.photos/seed/prod1/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (2, N'Switchable multimedia superstructure', N'Ex saepe reprehenderit doloribus. Vero tempore quia.', N'Algorithms', 63.68, 'https://notawise.com/files/sample_2.pdf', GETDATE(), 'user_1_8', 1, 'https://picsum.photos/seed/prod2/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (3, N'Persevering disintermediate middleware', N'Perspiciatis neque quod enim placeat.', N'Cybersecurity', 27.94, 'https://notawise.com/files/sample_3.pdf', GETDATE(), 'user_1_4', 1, 'https://picsum.photos/seed/prod3/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (4, N'Distributed full-range synergy', N'Repellendus natus veritatis facilis numquam eum quos nobis.', N'Web Development', 52.32, 'https://notawise.com/files/sample_4.pdf', GETDATE(), 'user_1_7', 1, 'https://picsum.photos/seed/prod4/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (5, N'User-friendly reciprocal core', N'Vel eius rerum minus aperiam odit neque. Odio molestiae harum ipsa est accusamus quod.', N'Data Structures', 72.79, 'https://notawise.com/files/sample_5.pdf', GETDATE(), 'user_1_3', 1, 'https://picsum.photos/seed/prod5/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (6, N'Re-contextualized human-resource hierarchy', N'Nemo dolores quae sint. Vero cum unde unde. Velit dolorum sunt quo non at.', N'Algorithms', 80.98, 'https://notawise.com/files/sample_6.pdf', GETDATE(), 'user_1_3', 1, 'https://picsum.photos/seed/prod6/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (7, N'Automated optimal Local Area Network', N'Perferendis nisi illo esse animi commodi. Tenetur provident quaerat quam.', N'Data Structures', 40.81, 'https://notawise.com/files/sample_7.pdf', GETDATE(), 'user_1_4', 1, 'https://picsum.photos/seed/prod7/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (8, N'Persevering coherent system engine', N'Aut non necessitatibus excepturi.', N'Algorithms', 63.71, 'https://notawise.com/files/sample_8.pdf', GETDATE(), 'user_1_6', 1, 'https://picsum.photos/seed/prod8/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (9, N'Compatible incremental application', N'A excepturi velit. Cum quod culpa perspiciatis.', N'Web Development', 25.73, 'https://notawise.com/files/sample_9.pdf', GETDATE(), 'user_1_6', 1, 'https://picsum.photos/seed/prod9/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (10, N'Business-focused zero-defect budgetary management', N'Inventore placeat eaque quas expedita consequatur nostrum. Adipisci nemo iure odit.', N'Web Development', 46.89, 'https://notawise.com/files/sample_10.pdf', GETDATE(), 'user_1_7', 1, 'https://picsum.photos/seed/prod10/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (11, N'Open-source zero administration firmware', N'Occaecati voluptas modi corporis fugiat qui. Esse sunt voluptatibus expedita veniam maiores vitae.', N'Databases', 92.58, 'https://notawise.com/files/sample_11.pdf', GETDATE(), 'user_1_8', 1, 'https://picsum.photos/seed/prod11/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (12, N'Multi-layered optimal standardization', N'Repellat dolorem culpa mollitia tempora quos magni. Ad officia cumque voluptatibus.', N'Machine Learning', 44.98, 'https://notawise.com/files/sample_12.pdf', GETDATE(), 'user_1_8', 1, 'https://picsum.photos/seed/prod12/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (13, N'Object-based methodical firmware', N'Molestiae cum sequi rerum corporis. Vitae laboriosam necessitatibus illum.', N'Machine Learning', 23.81, 'https://notawise.com/files/sample_13.pdf', GETDATE(), 'user_1_8', 1, 'https://picsum.photos/seed/prod13/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (14, N'Open-architected next generation standardization', N'Ut excepturi dolorem perspiciatis. Iure iure vel voluptatum repudiandae dolore.', N'Algorithms', 51.22, 'https://notawise.com/files/sample_14.pdf', GETDATE(), 'user_1_1', 1, 'https://picsum.photos/seed/prod14/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (15, N'Advanced homogeneous monitoring', N'Blanditiis non vel dicta.', N'Machine Learning', 76.51, 'https://notawise.com/files/sample_15.pdf', GETDATE(), 'user_1_7', 1, 'https://picsum.photos/seed/prod15/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (16, N'Triple-buffered holistic Graphical User Interface', N'Dolores labore consequuntur ipsam facere laborum. Voluptas minima assumenda error.', N'Machine Learning', 22.14, 'https://notawise.com/files/sample_16.pdf', GETDATE(), 'user_1_10', 1, 'https://picsum.photos/seed/prod16/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (17, N'Universal radical paradigm', N'Quibusdam veritatis hic iure. Distinctio facilis aliquid illo assumenda impedit necessitatibus.', N'Cybersecurity', 41.7, 'https://notawise.com/files/sample_17.pdf', GETDATE(), 'user_1_4', 1, 'https://picsum.photos/seed/prod17/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (18, N'Assimilated optimizing migration', N'Iure beatae ipsum soluta. Fugit quia unde dolorem nihil. Aliquid et nesciunt laborum.', N'Web Development', 42.33, 'https://notawise.com/files/sample_18.pdf', GETDATE(), 'user_1_8', 1, 'https://picsum.photos/seed/prod18/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (19, N'User-friendly needs-based moratorium', N'Maiores accusamus tenetur reprehenderit odio ducimus. Exercitationem voluptatum nostrum in.', N'Databases', 21.91, 'https://notawise.com/files/sample_19.pdf', GETDATE(), 'user_1_4', 1, 'https://picsum.photos/seed/prod19/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (20, N'Focused impactful customer loyalty', N'Quos dolorum suscipit. Consequuntur nisi ratione in nesciunt ducimus est.', N'Cybersecurity', 77.36, 'https://notawise.com/files/sample_20.pdf', GETDATE(), 'user_1_10', 1, 'https://picsum.photos/seed/prod20/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (21, N'Decentralized multi-tasking encryption', N'Quis consectetur rerum perspiciatis quia. Voluptates error sint recusandae quia quam ratione.', N'Cybersecurity', 88.45, 'https://notawise.com/files/sample_21.pdf', GETDATE(), 'user_2_4', 2, 'https://picsum.photos/seed/prod21/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (22, N'Fully-configurable value-added infrastructure', N'Voluptates voluptate optio ea asperiores. Nesciunt qui similique quis. Maiores architecto ipsum.', N'Cybersecurity', 79.5, 'https://notawise.com/files/sample_22.pdf', GETDATE(), 'user_2_7', 2, 'https://picsum.photos/seed/prod22/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (23, N'Implemented tangible groupware', N'Ratione deserunt ducimus. Accusantium nisi sequi voluptatem. Repudiandae dolor tempore.', N'Algorithms', 24.91, 'https://notawise.com/files/sample_23.pdf', GETDATE(), 'user_1_3', 2, 'https://picsum.photos/seed/prod23/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (24, N'Advanced radical monitoring', N'Qui sit fugit eum recusandae libero. Nostrum magni nesciunt velit.', N'Machine Learning', 73.14, 'https://notawise.com/files/sample_24.pdf', GETDATE(), 'user_2_2', 2, 'https://picsum.photos/seed/prod24/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (25, N'Secured content-based structure', N'Voluptas et voluptatem quia laborum laboriosam. Earum officia itaque quidem tempore maiores.', N'Databases', 89.65, 'https://notawise.com/files/sample_25.pdf', GETDATE(), 'user_2_3', 2, 'https://picsum.photos/seed/prod25/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (26, N'Sharable heuristic migration', N'Nobis id nam.', N'Databases', 77.99, 'https://notawise.com/files/sample_26.pdf', GETDATE(), 'user_1_1', 2, 'https://picsum.photos/seed/prod26/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (27, N'Horizontal encompassing extranet', N'Placeat sint similique minima quod soluta. Culpa consequuntur quis consequatur voluptatum.', N'Cybersecurity', 39.33, 'https://notawise.com/files/sample_27.pdf', GETDATE(), 'user_2_2', 2, 'https://picsum.photos/seed/prod27/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (28, N'Stand-alone impactful migration', N'Quos facilis recusandae ab nemo labore.', N'Algorithms', 82.81, 'https://notawise.com/files/sample_28.pdf', GETDATE(), 'user_1_10', 2, 'https://picsum.photos/seed/prod28/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (29, N'Up-sized grid-enabled software', N'Quis laboriosam omnis. Rerum possimus placeat neque.', N'Data Structures', 59.37, 'https://notawise.com/files/sample_29.pdf', GETDATE(), 'user_2_5', 2, 'https://picsum.photos/seed/prod29/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (30, N'Visionary responsive circuit', N'Voluptate delectus sit accusantium modi laboriosam. Quidem qui aspernatur quam.', N'Algorithms', 85.37, 'https://notawise.com/files/sample_30.pdf', GETDATE(), 'user_1_4', 2, 'https://picsum.photos/seed/prod30/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (31, N'Enhanced homogeneous budgetary management', N'Voluptate ipsam maxime. Repudiandae corporis iste at eius.', N'Algorithms', 46.16, 'https://notawise.com/files/sample_31.pdf', GETDATE(), 'user_2_5', 2, 'https://picsum.photos/seed/prod31/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (32, N'Devolved incremental encoding', N'Eligendi maxime odio qui corporis magni eum.', N'Cybersecurity', 38.46, 'https://notawise.com/files/sample_32.pdf', GETDATE(), 'user_1_6', 2, 'https://picsum.photos/seed/prod32/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (33, N'Robust mobile hardware', N'Corrupti nemo eaque distinctio velit consequuntur totam modi. Saepe error iusto assumenda.', N'Algorithms', 74.56, 'https://notawise.com/files/sample_33.pdf', GETDATE(), 'user_1_1', 2, 'https://picsum.photos/seed/prod33/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (34, N'Synergistic zero administration circuit', N'Nulla architecto eius earum iusto quod neque voluptatibus. Consequuntur voluptatem animi ex.', N'Web Development', 57.55, 'https://notawise.com/files/sample_34.pdf', GETDATE(), 'user_1_3', 2, 'https://picsum.photos/seed/prod34/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (35, N'Networked dedicated framework', N'Officiis earum reiciendis ea quod assumenda. Ipsum harum officia amet.', N'Data Structures', 20.7, 'https://notawise.com/files/sample_35.pdf', GETDATE(), 'user_2_5', 2, 'https://picsum.photos/seed/prod35/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (36, N'Fundamental multimedia initiative', N'Libero veniam cupiditate accusamus excepturi provident similique autem. Ipsa eum quam.', N'Data Structures', 88.63, 'https://notawise.com/files/sample_36.pdf', GETDATE(), 'user_1_7', 2, 'https://picsum.photos/seed/prod36/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (37, N'Realigned local capacity', N'Veniam minima praesentium. Dolores odio atque animi sapiente nobis error.', N'Web Development', 98.07, 'https://notawise.com/files/sample_37.pdf', GETDATE(), 'user_1_3', 2, 'https://picsum.photos/seed/prod37/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (38, N'Integrated needs-based budgetary management', N'Suscipit aut nulla qui doloribus. Placeat ipsam cumque ducimus. Ipsam rerum ad fugiat.', N'Cybersecurity', 86.85, 'https://notawise.com/files/sample_38.pdf', GETDATE(), 'user_1_10', 2, 'https://picsum.photos/seed/prod38/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (39, N'Advanced optimizing instruction set', N'Ipsam vero alias laboriosam tempore autem. Labore quasi quasi esse.', N'Web Development', 17.32, 'https://notawise.com/files/sample_39.pdf', GETDATE(), 'user_1_7', 2, 'https://picsum.photos/seed/prod39/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (40, N'Multi-layered 24hour frame', N'A numquam culpa nisi. Iusto aspernatur consequuntur veniam.', N'Cybersecurity', 81.98, 'https://notawise.com/files/sample_40.pdf', GETDATE(), 'user_1_3', 2, 'https://picsum.photos/seed/prod40/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (41, N'Optimized multimedia capacity', N'Magni alias sunt dolorum quas voluptatum tempore minus. Natus nemo hic esse necessitatibus at.', N'Databases', 38.32, 'https://notawise.com/files/sample_41.pdf', GETDATE(), 'user_2_7', 3, 'https://picsum.photos/seed/prod41/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (42, N'User-friendly fresh-thinking customer loyalty', N'Magnam libero odio eum. Nulla porro explicabo id. Vero quo voluptatibus nam. Odit doloremque alias.', N'Databases', 91.89, 'https://notawise.com/files/sample_42.pdf', GETDATE(), 'user_1_3', 3, 'https://picsum.photos/seed/prod42/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (43, N'Down-sized modular customer loyalty', N'Aperiam ut tenetur a tenetur. Atque culpa debitis ducimus.', N'Web Development', 96.51, 'https://notawise.com/files/sample_43.pdf', GETDATE(), 'user_3_8', 3, 'https://picsum.photos/seed/prod43/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (44, N'Operative next generation artificial intelligence', N'Adipisci perspiciatis harum. Expedita iusto ipsam quia provident labore delectus.', N'Web Development', 67.97, 'https://notawise.com/files/sample_44.pdf', GETDATE(), 'user_3_7', 3, 'https://picsum.photos/seed/prod44/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (45, N'Object-based national projection', N'Libero atque nesciunt ipsam et. Optio cum vel optio. Beatae eum eveniet ex.', N'Web Development', 49.19, 'https://notawise.com/files/sample_45.pdf', GETDATE(), 'user_1_8', 3, 'https://picsum.photos/seed/prod45/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (46, N'Front-line attitude-oriented structure', N'Magnam quae beatae ipsam autem. Minus minus nostrum molestias omnis sit et.', N'Data Structures', 43.8, 'https://notawise.com/files/sample_46.pdf', GETDATE(), 'user_2_4', 3, 'https://picsum.photos/seed/prod46/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (47, N'Multi-lateral human-resource projection', N'Exercitationem impedit ex eaque sit ipsam modi. Perferendis ut voluptatibus quidem ut accusamus.', N'Algorithms', 22.46, 'https://notawise.com/files/sample_47.pdf', GETDATE(), 'user_2_3', 3, 'https://picsum.photos/seed/prod47/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (48, N'Enterprise-wide stable matrix', N'Vel inventore delectus sapiente amet alias qui. Ratione quam sunt nihil.', N'Machine Learning', 40.38, 'https://notawise.com/files/sample_48.pdf', GETDATE(), 'user_2_7', 3, 'https://picsum.photos/seed/prod48/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (49, N'Universal clear-thinking conglomeration', N'Recusandae eveniet ipsum quae molestias. Id aperiam exercitationem suscipit.', N'Web Development', 18.43, 'https://notawise.com/files/sample_49.pdf', GETDATE(), 'user_1_3', 3, 'https://picsum.photos/seed/prod49/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (50, N'User-friendly logistical solution', N'Reprehenderit earum eligendi illo ad temporibus. Consectetur repellendus eveniet non.', N'Algorithms', 34.27, 'https://notawise.com/files/sample_50.pdf', GETDATE(), 'user_1_7', 3, 'https://picsum.photos/seed/prod50/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (51, N'Realigned high-level parallelism', N'At beatae laboriosam temporibus. Adipisci sequi ex explicabo dolorum.', N'Databases', 36.06, 'https://notawise.com/files/sample_51.pdf', GETDATE(), 'user_3_2', 3, 'https://picsum.photos/seed/prod51/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (52, N'Diverse context-sensitive success', N'Repellat veniam explicabo fugiat error. Quae numquam cumque illo pariatur.', N'Databases', 21.67, 'https://notawise.com/files/sample_52.pdf', GETDATE(), 'user_1_6', 3, 'https://picsum.photos/seed/prod52/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (53, N'Diverse zero administration portal', N'Excepturi quas necessitatibus distinctio dicta.', N'Cybersecurity', 75.75, 'https://notawise.com/files/sample_53.pdf', GETDATE(), 'user_1_3', 3, 'https://picsum.photos/seed/prod53/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (54, N'Multi-tiered zero tolerance definition', N'Totam doloremque voluptatem dicta placeat. Modi dolorum cumque vero.', N'Machine Learning', 26.16, 'https://notawise.com/files/sample_54.pdf', GETDATE(), 'user_3_9', 3, 'https://picsum.photos/seed/prod54/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (55, N'Decentralized executive superstructure', N'Laborum eos velit sed. Neque dolores labore deserunt incidunt ut unde.', N'Web Development', 16.38, 'https://notawise.com/files/sample_55.pdf', GETDATE(), 'user_3_2', 3, 'https://picsum.photos/seed/prod55/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (56, N'Cloned maximized parallelism', N'Quis sit doloremque numquam. Velit veniam vitae voluptatem tenetur necessitatibus.', N'Machine Learning', 36.93, 'https://notawise.com/files/sample_56.pdf', GETDATE(), 'user_1_6', 3, 'https://picsum.photos/seed/prod56/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (57, N'Distributed bi-directional migration', N'Reiciendis alias atque vel eligendi quis ducimus. Exercitationem eum doloribus.', N'Algorithms', 60.47, 'https://notawise.com/files/sample_57.pdf', GETDATE(), 'user_3_8', 3, 'https://picsum.photos/seed/prod57/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (58, N'Streamlined high-level encryption', N'Quisquam pariatur sint libero est ratione. Et omnis praesentium voluptates nulla repudiandae quod.', N'Cybersecurity', 40.34, 'https://notawise.com/files/sample_58.pdf', GETDATE(), 'user_2_5', 3, 'https://picsum.photos/seed/prod58/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (59, N'Sharable multi-tasking product', N'Porro quaerat sint quia repellat sapiente. Rerum autem deserunt perferendis a ut.', N'Algorithms', 53.12, 'https://notawise.com/files/sample_59.pdf', GETDATE(), 'user_3_8', 3, 'https://picsum.photos/seed/prod59/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (60, N'Grass-roots multimedia framework', N'Velit illo ipsum labore ex. Quod velit quo autem possimus corrupti itaque.', N'Cybersecurity', 13.4, 'https://notawise.com/files/sample_60.pdf', GETDATE(), 'user_2_5', 3, 'https://picsum.photos/seed/prod60/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (61, N'Profit-focused exuding functionalities', N'Fugit recusandae officia. Saepe eveniet perspiciatis itaque dolorum possimus iure possimus.', N'Algorithms', 44.63, 'https://notawise.com/files/sample_61.pdf', GETDATE(), 'user_1_6', 4, 'https://picsum.photos/seed/prod61/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (62, N'Universal user-facing budgetary management', N'Quod facilis assumenda nemo placeat facilis.', N'Cybersecurity', 60.08, 'https://notawise.com/files/sample_62.pdf', GETDATE(), 'user_2_4', 4, 'https://picsum.photos/seed/prod62/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (63, N'Organized contextually-based infrastructure', N'Minima porro incidunt est cum. Esse cum distinctio neque reiciendis. Autem voluptatum dolorum enim.', N'Cybersecurity', 92.81, 'https://notawise.com/files/sample_63.pdf', GETDATE(), 'user_4_5', 4, 'https://picsum.photos/seed/prod63/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (64, N'Centralized 4thgeneration Graphical User Interface', N'Illum excepturi aut quas. Earum unde quasi cupiditate. Ipsa similique accusamus minima in ratione.', N'Web Development', 71.14, 'https://notawise.com/files/sample_64.pdf', GETDATE(), 'user_3_5', 4, 'https://picsum.photos/seed/prod64/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (65, N'Managed bifurcated process improvement', N'Dolores ratione ratione aperiam. Laboriosam temporibus dolore dolores aliquam necessitatibus.', N'Algorithms', 43.15, 'https://notawise.com/files/sample_65.pdf', GETDATE(), 'user_2_3', 4, 'https://picsum.photos/seed/prod65/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (66, N'Down-sized clear-thinking success', N'Tempore fugit in. Reiciendis aliquid expedita. Nulla quia accusamus occaecati.', N'Databases', 79.94, 'https://notawise.com/files/sample_66.pdf', GETDATE(), 'user_3_5', 4, 'https://picsum.photos/seed/prod66/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (67, N'Robust content-based neural-net', N'Voluptatum optio culpa laudantium nemo consequuntur soluta.', N'Data Structures', 42.27, 'https://notawise.com/files/sample_67.pdf', GETDATE(), 'user_1_4', 4, 'https://picsum.photos/seed/prod67/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (68, N'Customer-focused dynamic installation', N'Et in iure sed. Minima facilis sint nesciunt labore. Voluptates odit repellat repellat.', N'Web Development', 12.49, 'https://notawise.com/files/sample_68.pdf', GETDATE(), 'user_3_9', 4, 'https://picsum.photos/seed/prod68/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (69, N'Balanced encompassing leverage', N'Eius quas accusantium iure nulla quo.
Cumque similique maxime. At sint ad perspiciatis iure magni.', N'Cybersecurity', 77.72, 'https://notawise.com/files/sample_69.pdf', GETDATE(), 'user_1_10', 4, 'https://picsum.photos/seed/prod69/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (70, N'Grass-roots discrete support', N'Perspiciatis facilis dolorem quisquam.', N'Algorithms', 54.74, 'https://notawise.com/files/sample_70.pdf', GETDATE(), 'user_2_3', 4, 'https://picsum.photos/seed/prod70/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (71, N'Diverse contextually-based knowledge user', N'Aspernatur doloremque id. Quibusdam corporis enim rem est aliquid dignissimos laborum.', N'Data Structures', 67.69, 'https://notawise.com/files/sample_71.pdf', GETDATE(), 'user_1_10', 4, 'https://picsum.photos/seed/prod71/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (72, N'Exclusive modular database', N'Labore aliquid accusantium veniam.', N'Databases', 23.17, 'https://notawise.com/files/sample_72.pdf', GETDATE(), 'user_1_10', 4, 'https://picsum.photos/seed/prod72/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (73, N'Focused impactful throughput', N'Laudantium reiciendis aut. Aspernatur quam occaecati sed.', N'Cybersecurity', 44.02, 'https://notawise.com/files/sample_73.pdf', GETDATE(), 'user_4_3', 4, 'https://picsum.photos/seed/prod73/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (74, N'Function-based multi-tasking collaboration', N'Vero blanditiis vitae delectus aliquid velit. Natus ut quia.', N'Data Structures', 19.43, 'https://notawise.com/files/sample_74.pdf', GETDATE(), 'user_4_6', 4, 'https://picsum.photos/seed/prod74/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (75, N'Visionary optimizing policy', N'Molestias fuga ullam eaque. Amet illum velit reiciendis eius tempore.', N'Cybersecurity', 23.36, 'https://notawise.com/files/sample_75.pdf', GETDATE(), 'user_3_2', 4, 'https://picsum.photos/seed/prod75/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (76, N'Re-contextualized dedicated Local Area Network', N'Iure excepturi vel enim eum qui. Perspiciatis optio consequuntur molestiae occaecati et adipisci.', N'Web Development', 71.19, 'https://notawise.com/files/sample_76.pdf', GETDATE(), 'user_3_9', 4, 'https://picsum.photos/seed/prod76/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (77, N'Front-line asynchronous database', N'Dicta fuga error eius perspiciatis excepturi animi cum. Quasi inventore mollitia possimus.', N'Cybersecurity', 71.14, 'https://notawise.com/files/sample_77.pdf', GETDATE(), 'user_2_5', 4, 'https://picsum.photos/seed/prod77/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (78, N'Down-sized radical conglomeration', N'Et fugiat ullam dignissimos. Voluptates vel occaecati quasi officia in.', N'Cybersecurity', 99.84, 'https://notawise.com/files/sample_78.pdf', GETDATE(), 'user_4_8', 4, 'https://picsum.photos/seed/prod78/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (79, N'Sharable fresh-thinking frame', N'Officiis laudantium quibusdam laborum numquam. Esse ipsam eaque.', N'Web Development', 88.72, 'https://notawise.com/files/sample_79.pdf', GETDATE(), 'user_4_3', 4, 'https://picsum.photos/seed/prod79/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (80, N'Self-enabling actuating Graphic Interface', N'Placeat quo magni accusantium officiis reiciendis non.', N'Databases', 93.82, 'https://notawise.com/files/sample_80.pdf', GETDATE(), 'user_1_1', 4, 'https://picsum.photos/seed/prod80/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (81, N'Distributed asymmetric toolset', N'Iure occaecati tempora nesciunt enim molestiae ratione. Atque suscipit a quis itaque minus.', N'Web Development', 73.57, 'https://notawise.com/files/sample_81.pdf', GETDATE(), 'user_3_8', 5, 'https://picsum.photos/seed/prod81/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (82, N'Innovative scalable migration', N'Nihil perspiciatis ut placeat. Itaque commodi maxime quibusdam.', N'Algorithms', 82.0, 'https://notawise.com/files/sample_82.pdf', GETDATE(), 'user_3_9', 5, 'https://picsum.photos/seed/prod82/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (83, N'Customer-focused reciprocal toolset', N'Inventore labore cum amet deleniti libero. Cum cum distinctio. Placeat sed deleniti temporibus.', N'Algorithms', 15.97, 'https://notawise.com/files/sample_83.pdf', GETDATE(), 'user_1_7', 5, 'https://picsum.photos/seed/prod83/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (84, N'Configurable regional artificial intelligence', N'Ducimus itaque minima voluptate.', N'Algorithms', 37.04, 'https://notawise.com/files/sample_84.pdf', GETDATE(), 'user_5_5', 5, 'https://picsum.photos/seed/prod84/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (85, N'Centralized optimizing contingency', N'Unde quaerat molestias sint ullam unde. Nulla repellat unde quod voluptate.', N'Cybersecurity', 39.75, 'https://notawise.com/files/sample_85.pdf', GETDATE(), 'user_1_8', 5, 'https://picsum.photos/seed/prod85/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (86, N'Visionary impactful function', N'Repellat non ratione occaecati est. Rerum non ad repudiandae voluptate quasi quas illo.', N'Data Structures', 88.18, 'https://notawise.com/files/sample_86.pdf', GETDATE(), 'user_3_7', 5, 'https://picsum.photos/seed/prod86/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (87, N'Right-sized coherent definition', N'Similique officiis voluptatum ipsam ipsam. Ullam illum quod ipsam exercitationem qui nostrum est.', N'Machine Learning', 55.45, 'https://notawise.com/files/sample_87.pdf', GETDATE(), 'user_3_9', 5, 'https://picsum.photos/seed/prod87/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (88, N'Fully-configurable optimizing emulation', N'Autem excepturi impedit consequuntur fugit.', N'Databases', 13.03, 'https://notawise.com/files/sample_88.pdf', GETDATE(), 'user_1_4', 5, 'https://picsum.photos/seed/prod88/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (89, N'Front-line attitude-oriented knowledgebase', N'Laborum eum debitis magnam a dolore modi. Fuga ex est sint.', N'Web Development', 81.47, 'https://notawise.com/files/sample_89.pdf', GETDATE(), 'user_3_9', 5, 'https://picsum.photos/seed/prod89/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (90, N'Pre-emptive 5thgeneration projection', N'Earum vitae provident. Aut illum ex dignissimos ullam quos.', N'Databases', 99.15, 'https://notawise.com/files/sample_90.pdf', GETDATE(), 'user_5_2', 5, 'https://picsum.photos/seed/prod90/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (91, N'Streamlined motivating Graphical User Interface', N'Laborum fuga hic libero reprehenderit molestias praesentium. Commodi quas recusandae numquam quasi.', N'Cybersecurity', 91.52, 'https://notawise.com/files/sample_91.pdf', GETDATE(), 'user_1_10', 5, 'https://picsum.photos/seed/prod91/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (92, N'Managed non-volatile groupware', N'Dolorum dolor illum tenetur aspernatur.', N'Machine Learning', 58.19, 'https://notawise.com/files/sample_92.pdf', GETDATE(), 'user_4_6', 5, 'https://picsum.photos/seed/prod92/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (93, N'Programmable logistical moratorium', N'Non libero esse amet accusantium quaerat. Optio distinctio dolorem occaecati.', N'Cybersecurity', 84.31, 'https://notawise.com/files/sample_93.pdf', GETDATE(), 'user_3_8', 5, 'https://picsum.photos/seed/prod93/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (94, N'Extended 5thgeneration open architecture', N'Nam tempore esse ipsam nisi in in dicta. Repellendus officiis natus sunt similique accusantium.', N'Cybersecurity', 64.67, 'https://notawise.com/files/sample_94.pdf', GETDATE(), 'user_2_2', 5, 'https://picsum.photos/seed/prod94/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (95, N'Robust even-keeled info-mediaries', N'Omnis aspernatur est esse. Nulla libero minima eligendi dicta quidem.', N'Algorithms', 69.13, 'https://notawise.com/files/sample_95.pdf', GETDATE(), 'user_1_1', 5, 'https://picsum.photos/seed/prod95/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (96, N'Intuitive global artificial intelligence', N'Voluptatum suscipit quasi earum eligendi corrupti. Id non dolorem vero ipsum tempora reiciendis ut.', N'Web Development', 26.38, 'https://notawise.com/files/sample_96.pdf', GETDATE(), 'user_3_9', 5, 'https://picsum.photos/seed/prod96/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (97, N'Pre-emptive maximized function', N'Atque quod id iure atque. Ut sed doloribus itaque.', N'Databases', 32.9, 'https://notawise.com/files/sample_97.pdf', GETDATE(), 'user_1_4', 5, 'https://picsum.photos/seed/prod97/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (98, N'Reverse-engineered mission-critical knowledge user', N'Iure officia unde debitis quisquam ut illum natus. Cumque porro culpa laboriosam cumque facilis.', N'Cybersecurity', 87.39, 'https://notawise.com/files/sample_98.pdf', GETDATE(), 'user_5_7', 5, 'https://picsum.photos/seed/prod98/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (99, N'Re-contextualized bifurcated framework', N'Ea in repellat est rem ipsa. Debitis iste consequatur natus consectetur velit ullam eius.', N'Machine Learning', 79.52, 'https://notawise.com/files/sample_99.pdf', GETDATE(), 'user_3_2', 5, 'https://picsum.photos/seed/prod99/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (100, N'Enterprise-wide 5thgeneration application', N'Soluta quam amet unde at.', N'Cybersecurity', 15.6, 'https://notawise.com/files/sample_100.pdf', GETDATE(), 'user_4_8', 5, 'https://picsum.photos/seed/prod100/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (101, N'Re-contextualized transitional methodology', N'Non velit magni sed placeat cupiditate. Et numquam nostrum tempora.', N'Web Development', 23.62, 'https://notawise.com/files/sample_101.pdf', GETDATE(), 'user_5_1', 6, 'https://picsum.photos/seed/prod101/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (102, N'Horizontal well-modulated orchestration', N'Nobis dolorum beatae laborum magnam quae tempore. Inventore totam nesciunt quos reprehenderit.', N'Cybersecurity', 13.17, 'https://notawise.com/files/sample_102.pdf', GETDATE(), 'user_6_4', 6, 'https://picsum.photos/seed/prod102/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (103, N'Total tertiary concept', N'Iure repudiandae et sequi laborum. Voluptates vel vitae itaque.', N'Cybersecurity', 51.3, 'https://notawise.com/files/sample_103.pdf', GETDATE(), 'user_1_10', 6, 'https://picsum.photos/seed/prod103/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (104, N'Ergonomic discrete infrastructure', N'Quibusdam odio nesciunt perspiciatis. Molestias rem repudiandae eveniet atque tempore quo.', N'Cybersecurity', 80.03, 'https://notawise.com/files/sample_104.pdf', GETDATE(), 'user_1_3', 6, 'https://picsum.photos/seed/prod104/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (105, N'Enterprise-wide dynamic throughput', N'Totam illo voluptate nostrum. Accusantium unde expedita natus placeat.', N'Algorithms', 63.85, 'https://notawise.com/files/sample_105.pdf', GETDATE(), 'user_2_3', 6, 'https://picsum.photos/seed/prod105/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (106, N'Managed static Internet solution', N'Facere aut doloribus optio.
Ab repudiandae molestiae. Sint ullam velit quo non.', N'Web Development', 39.15, 'https://notawise.com/files/sample_106.pdf', GETDATE(), 'user_5_1', 6, 'https://picsum.photos/seed/prod106/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (107, N'Exclusive national hub', N'Facilis recusandae magni libero dignissimos facere quibusdam impedit. Qui a similique officiis.', N'Data Structures', 44.51, 'https://notawise.com/files/sample_107.pdf', GETDATE(), 'user_6_7', 6, 'https://picsum.photos/seed/prod107/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (108, N'Pre-emptive zero-defect capability', N'Fuga suscipit exercitationem. Excepturi consequuntur corrupti quas at tenetur id aut.', N'Algorithms', 89.31, 'https://notawise.com/files/sample_108.pdf', GETDATE(), 'user_6_4', 6, 'https://picsum.photos/seed/prod108/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (109, N'Synergized reciprocal service-desk', N'Distinctio aperiam sapiente. Libero numquam illo nihil et cum. Nesciunt voluptate iure repellendus.', N'Databases', 66.91, 'https://notawise.com/files/sample_109.pdf', GETDATE(), 'user_4_9', 6, 'https://picsum.photos/seed/prod109/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (110, N'De-engineered zero tolerance orchestration', N'Illo fugit recusandae sapiente molestiae illum ipsam. Officiis esse deserunt veniam.', N'Web Development', 21.19, 'https://notawise.com/files/sample_110.pdf', GETDATE(), 'user_4_5', 6, 'https://picsum.photos/seed/prod110/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (111, N'Centralized asymmetric neural-net', N'Tempore nihil a. Similique atque deleniti molestiae aliquam harum.', N'Data Structures', 96.26, 'https://notawise.com/files/sample_111.pdf', GETDATE(), 'user_5_5', 6, 'https://picsum.photos/seed/prod111/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (112, N'Implemented even-keeled time-frame', N'In veniam adipisci. Deserunt a assumenda. Odit temporibus possimus autem odit et numquam.', N'Machine Learning', 92.52, 'https://notawise.com/files/sample_112.pdf', GETDATE(), 'user_2_2', 6, 'https://picsum.photos/seed/prod112/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (113, N'Configurable grid-enabled utilization', N'Qui suscipit aliquid delectus atque facere rerum. Quibusdam molestias doloremque.', N'Databases', 87.44, 'https://notawise.com/files/sample_113.pdf', GETDATE(), 'user_3_2', 6, 'https://picsum.photos/seed/prod113/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (114, N'Quality-focused global challenge', N'Vero modi a id. Rem quos quasi possimus ab iure id.', N'Algorithms', 80.39, 'https://notawise.com/files/sample_114.pdf', GETDATE(), 'user_6_2', 6, 'https://picsum.photos/seed/prod114/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (115, N'Networked bottom-line software', N'Harum non molestias in. Veritatis impedit eaque officiis. Vel impedit qui assumenda.', N'Machine Learning', 78.1, 'https://notawise.com/files/sample_115.pdf', GETDATE(), 'user_6_4', 6, 'https://picsum.photos/seed/prod115/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (116, N'Fully-configurable 4thgeneration hierarchy', N'Est soluta inventore eius consectetur. Consequatur libero natus mollitia optio.', N'Machine Learning', 81.06, 'https://notawise.com/files/sample_116.pdf', GETDATE(), 'user_1_7', 6, 'https://picsum.photos/seed/prod116/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (117, N'Re-engineered logistical frame', N'Porro dolorem quae dignissimos. Magni consequatur eius.', N'Algorithms', 91.17, 'https://notawise.com/files/sample_117.pdf', GETDATE(), 'user_1_4', 6, 'https://picsum.photos/seed/prod117/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (118, N'Adaptive high-level structure', N'Sapiente explicabo nisi quos praesentium nam. Culpa hic doloribus autem.', N'Cybersecurity', 32.98, 'https://notawise.com/files/sample_118.pdf', GETDATE(), 'user_1_3', 6, 'https://picsum.photos/seed/prod118/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (119, N'Switchable non-volatile customer loyalty', N'Adipisci vero ut odit quis. Voluptas voluptatum amet sapiente officiis et.', N'Databases', 69.99, 'https://notawise.com/files/sample_119.pdf', GETDATE(), 'user_3_5', 6, 'https://picsum.photos/seed/prod119/300');

INSERT INTO Products (id, title, description, category, price, file_link, created_at, creator_username, organization_id, image_link) VALUES (120, N'Universal upward-trending functionalities', N'Iste libero eius perspiciatis dicta temporibus.', N'Data Structures', 18.41, 'https://notawise.com/files/sample_120.pdf', GETDATE(), 'user_6_10', 6, 'https://picsum.photos/seed/prod120/300');

SET IDENTITY_INSERT [dbo].[Products] OFF;


SET IDENTITY_INSERT [dbo].[Orders] ON;

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (1, 45, 180.93, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (2, 33, 126.33, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (3, 8, 86.42, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (4, 58, 191.5, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (5, 60, 71.01, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (6, 7, 153.91, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (7, 7, 153.79, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (8, 10, 233.57, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (9, 2, 247.84, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (10, 28, 221.6, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (11, 2, 174.16, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (12, 56, 290.56, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (13, 47, 113.15, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (14, 23, 67.58, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (15, 23, 222.94, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (16, 23, 136.97, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (17, 1, 257.57, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (18, 15, 254.75, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (19, 5, 199.15, GETDATE(), 'confirmed');

INSERT INTO Orders (id, user_id, total_price, order_date, status) VALUES (20, 10, 101.99, GETDATE(), 'confirmed');

SET IDENTITY_INSERT [dbo].[Orders] OFF;


SET IDENTITY_INSERT [dbo].[Order_Items] ON;

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (1, 7, 85, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (2, 4, 96, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (3, 10, 48, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (4, 1, 120, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (5, 8, 110, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (6, 6, 59, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (7, 16, 45, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (8, 9, 17, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (9, 7, 47, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (10, 16, 38, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (11, 18, 82, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (12, 6, 76, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (13, 4, 69, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (14, 10, 21, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (15, 5, 17, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (16, 11, 66, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (17, 8, 97, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (18, 10, 48, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (19, 2, 111, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (20, 20, 3, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (21, 3, 90, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (22, 5, 54, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (23, 18, 54, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (24, 5, 76, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (25, 10, 82, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (26, 3, 32, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (27, 12, 82, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (28, 2, 49, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (29, 1, 54, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (30, 11, 57, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (31, 12, 38, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (32, 3, 24, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (33, 9, 15, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (34, 20, 89, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (35, 15, 119, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (36, 6, 99, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (37, 14, 23, 1);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (38, 15, 44, 3);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (39, 5, 46, 2);

INSERT INTO Order_Items (id, order_id, product_id, quantity) VALUES (40, 3, 62, 1);

SET IDENTITY_INSERT [dbo].[Order_Items] OFF;