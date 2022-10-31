<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3 bg-white shadow-lg">

				<div class="mt-4">
					<h2 class="text-center">Update Here</h2>
				</div>

				<div class="mx-5 my-3">
					<form:form modelAttribute="employee">

						<div class="mb-3">
							<label for="" class="form-label">Id</label>
							<form:input path="id" cssClass="form-control" id="name"
								readonly="true" />
						</div>

						<div class="mb-3">
							<label for="" class="form-label">Name</label>
							<form:input path="name" cssClass="form-control" id="name"
								placeholder="" />
							<span class="text-danger" id="nameErr"></span>
						</div>

						<div class="mb-3">
							<label for="" class="form-label">Email</label>
							<form:input cssClass="form-control" path="email" type="email"
								id="email" />
							<span class="text-danger" id="emailErr"></span>
						</div>

						<div class="mb-3">
							<label for="" class="form-label">Job</label>
							<form:select path="job" cssClass="form-select">
								<form:options items="${jobs }" />
							</form:select>
						</div>

						<div class="mb-3">
							<label for="" class="form-label">Country</label>
							<form:select path="country" cssClass="form-select">
								<form:options items="${countries }" />
							</form:select>
						</div>

						<div class="mb-3">
							<label for="" class="form-label">Salary</label>
							<form:input cssClass="form-control" path="salary" type="number" />
							<span class="text-danger" id="salaryErr"></span>
						</div>

						<div class="mb-4">
							<input type="submit" value="update"
								class="form-control btn text-white text-uppercase">
						</div>

					</form:form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>