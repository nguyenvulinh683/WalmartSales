# Walmart Sales Data Analysis

## About

Dự án này nhằm khám phá dữ liệu Bán hàng Walmart để hiểu rõ các chi nhánh và sản phẩm có hiệu suất cao, xu hướng bán hàng của các sản phẩm khác nhau, hành vi khách hàng. Mục tiêu là nghiên cứu cách tối ưu hóa và cải thiện các chiến lược bán hàng. Dữ liệu được thu thập từ [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).

“Trong cuộc thi tuyển dụng này, người tìm việc được cung cấp dữ liệu bán hàng lịch sử cho 45 chi nhánh Walmart được đặt ở các vùng khác nhau. Mỗi chi nhánh chứa nhiều bộ phận, và người tham gia phải dự báo bán hàng cho mỗi bộ phận trong mỗi chi nhánh. Để thêm vào thử thách, các sự kiện markdown được chọn được bao gồm trong dữ liệu. Các markdown này biết đến ảnh hưởng đến bán hàng, nhưng việc dự báo các bộ phận bị ảnh hưởng và mức độ ảnh hưởng là khó khăn.” [source](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)

## Purposes Of The Project

Mục tiêu chính của dự án này là nắm bắt được các yếu tố ảnh hưởng đến bán hàng của Walmart để hiểu rõ các sản phẩm khác nhau.

## About Data

Dữ liệu được thu thập từ Cuộc thi Dự báo Bán hàng Walmart. Dữ liệu này chứa các giao dịch bán hàng từ ba chi nhánh Walmart khác nhau, tọa lạc tại Mandalay, Yangon và Naypyitaw. Dữ liệu có 17 cột và 1000 hàng:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

### Analysis List

1. Product Analysis

> Thực hiện phân tích trên dữ liệu để hiểu rõ các loại sản phẩm khác nhau, các loại sản phẩm có hiệu suất cao và các loại sản phẩm cần được cải thiện.

2. Sales Analysis

> Phân tích này nhằm trả lời câu hỏi về xu hướng bán hàng của sản phẩm. Kết quả của phân tích này có thể giúp đo lường hiệu quả của mỗi chiến lược bán hàng mà doanh nghiệp áp dụng và những thay đổi cần thiết để tăng doanh số.

3. Customer Analysis

> Phân tích này nhằm khám phá ra các nhóm khách hàng khác nhau, xu hướng mua hàng và lợi nhuận của mỗi nhóm khách hàng.

## Approach Used

1. **Data Wrangling:** Đây là bước đầu tiên để kiểm tra dữ liệu và phát hiện các giá trị NULL và các giá trị bị mất. Sử dụng các phương pháp thay thế dữ liệu để thay thế, bỏ qua hoặc NULL các giá trị.

> 1. Xây dựng một cơ sở dữ liệu
> 2. Tạo bảng và chèn dữ liệu.
> 3. Chọn các cột có giá trị NULL trong chúng. Chúng tôi không có giá trị NULL trong cơ sở dữ liệu của chúng tôi khi tạo các bảng, vì khi tạo các bảng, chúng tôi đặt NOT NULL cho mỗi trường, do đó các giá trị NULL được lọc ra.

2. **Feature Engineering:**  Điều này sẽ giúp chúng ta tạo ra một số cột mới từ các cột hiện có.

> 1.Thêm một cột mới có tên là time_of_day để cung cấp cái nhìn về doanh số vào Buổi Sáng, Buổi Trưa và Buổi Tối. Điều này sẽ giúp trả lời câu hỏi về phần nào của ngày có doanh số nhiều nhất.

> 2.Thêm một cột mới có tên là day_name chứa các ngày trong tuần được trích xuất từ giao dịch đã xảy ra (Mon, Tue, Wed, Thur, Fri). Điều này sẽ giúp trả lời câu hỏi về tuần nào trong ngày mỗi chi nhánh bận rộn nhất.

> 3. Thêm một cột mới có tên là month_name chứa các tháng trong năm được trích xuất từ giao dịch đã xảy ra (Jan, Feb, Mar). Giúp xác định tháng nào trong năm có doanh số và lợi nhuận nhiều nhất.

2. **Exploratory Data Analysis (EDA):**  Exploratory data analysis được thực hiện để trả lời các câu hỏi và mục tiêu của dự án này.
3. **Conclusion:**

## Business Questions To Answer

### Generic Question

1. How many unique cities does the data have?
2. In which city is each branch?

### Product

1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
5. What is the city with the largest revenue?
6. What product line had the largest VAT?
7. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
8. Which branch sold more products than average product sold?
9. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
4. Which customer type pays the most in VAT?

### Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?


