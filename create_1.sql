CREATE TABLE Author
(
author_numb int PRIMARY KEY AUTO_INCREMENT,
author_last_first char (128)
);

CREATE TABLE Condition_Codes
(
  condition_code int PRIMARY KEY AUTO_INCREMENT,
  condition_description varchar (128)
);