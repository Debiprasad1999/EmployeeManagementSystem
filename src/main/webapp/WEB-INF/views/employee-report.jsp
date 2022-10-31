<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/9793f0c227.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="text-center mb-3 mt-3">Employees Report</h1>

		<div>
			<c:if test="${!empty successMsg }">
				<div class="alert alert-success" role="alert" id="alertmsg">
					${successMsg }
				</div>
			</c:if>			
		</div>
		
		<div>
			<c:if test="${!empty deleteMsg }">
				<div class="alert alert-danger" role="alert" id="alertmsg">
					${deleteMsg }
				</div>
			</c:if>			
		</div>
		
		<div>
			<c:if test="${!empty updateMsg }">
				<div class="alert alert-success" role="alert" id="alertmsg">
					${updateMsg }
				</div>
			</c:if>			
		</div>

		<div class="row">
			<div class="col-8">
				<a href="registeremployee" class="btn btn-primary"> <i
					class="fa-solid fa-user-plus"></i> Add Employee
				</a> 
				<a href="./" class="btn btn-primary">
				<i class="fa-solid fa-house-chimney"></i> Home</a>
			</div>

		</div>

		<div class="table-responsive">
			<table class="table table-striped table-bordered mt-3 text-center">
				<thead class="bg-primary text-white">

					<tr>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">job</th>
						<th scope="col">Country</th>
						<th scope="col">Salary</th>
						<th scope="col">Action</th>
					</tr>

				</thead>
				<tbody>
					<c:choose>
						<c:when test="${!empty employees }">
							<c:forEach var="employee" items="${employees }">
								<tr>
									<th scope="col">${employee.id }</th>
									<th scope="col">${employee.name }</th>
									<th scope="col">${employee.email }</th>
									<th scope="col">${employee.job }</th>
									<th scope="col">${employee.country }</th>
									<th scope="col">${employee.salary }</th>
									<td>
										<a href="updateemployee?id=${employee.id }" class="btn btn-success mr-3 px-3">Update</a>
										<a href="deleteemployee?id=${employee.id }" class="btn btn-danger px-3">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr >
								<td colspan="7">
									<h2 class="text-center text-danger">Data Not Found</h2>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					

				</tbody>
			</table>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageNumber == 0 }">
						<li class="page-item disabled">
							<a class="page-link" href="viewemployees?page=${pageNumber - 1 }">Previous</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="viewemployees?page=${pageNumber - 1 }">Previous</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				
				<c:forEach var="i" begin="1" end="${totalPages }">
					<c:choose>
						<c:when test="${pageNumber+1 == i }">
							<li class="page-item active">
								<a class="page-link" href="viewemployees?page=${i-1 }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="viewemployees?page=${i-1 }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${isLast }">
						<li class="page-item disabled">
							<a class="page-link" href="viewemployees?page=${pageNumber + 1 }">Next</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="viewemployees?page=${pageNumber + 1 }">Next</a>
						</li>
					</c:otherwise>
				</c:choose>				
			</ul>
		</nav>

	</div>

	<script>
		var id = setTimeout(Anim, 3000);
		function Anim() {
			var target = document.getElementById("alertmsg");
			target.style.display = 'none';
		}
	</script>
</body>
</html>