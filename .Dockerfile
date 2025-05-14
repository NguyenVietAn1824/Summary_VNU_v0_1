# Sử dụng phiên bản nhẹ hơn
FROM --platform=linux/amd64 python:3.11-slim

# Thiết lập thư mục làm việc
WORKDIR /app/src

# Cài đặt dependencies trước để tận dụng cache
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy toàn bộ mã nguồn sau khi đã cài thư viện xong
COPY . .

# Mở cổng ứng dụng
EXPOSE 5002

# Chạy ứng dụng Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=5002", "--server.address=0.0.0.0"]
