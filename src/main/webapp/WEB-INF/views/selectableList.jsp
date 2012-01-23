<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
        <style type="text/css">
			.selectableList {
				float: left;
				margin: 0 10px 10px 0;
				min-width: 150px;
			}
			.selectableList ul {
			    padding: 0;
			    margin: 0;
				list-style: none outside none;
				border: 1px #000 dotted;
				min-height: 125px;
			}
			.selectableList ul li:hover {
				cursor: pointer;
				background-color: #eee;
			}
			.clear {
				clear:both;
			}
			.selectableList ul li .action {
				padding: 0 3px 0 0;
			}
			#availableItems li:hover .action {
				width: 20px;
				background-image: url('<c:url value="/resources/imgs/addRemove.png" />');
				background-position: 2 3;
				background-repeat: no-repeat;

			}
			#selectedItems li:hover .action {
				width: 20px;
				background-image: url('<c:url value="/resources/imgs/addRemove.png" />');
				background-position: -19 3;
				background-repeat: no-repeat;
			}
		</style>
    </head>
    <body>
        <form method="POST" modelAttribute="selectableListForm">
           <div class="selectableList">
                <span>Available Items:</span><br />
                <ul id="availableItems">
                    <c:forEach var="item" items="${availableItems}">
                        <li><img class="action" src="<c:url value="/resources/imgs/img_trans.png" />" width="20px" height="20px"/><span>${item}</span><input type="hidden" name="availableItem" value="${item}"/></li>
                    </c:forEach>
                </ul>
           </div>
           <div class="selectableList">
                <span>Selected Items:</span><br />
                <ul id="selectedItems">
                    <c:forEach var="item" items="${selectableListForm.selectedItem}">
                        <li><img class="action" src="<c:url value="/resources/imgs/img_trans.png" />" width="20px" height="20px"/><span>${item}</span><input type="hidden" name="selectedItem" value="${item}"/></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear">
                <input type="submit"/>
            </div>
        </form>
    </body>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.7.1.min.js" />"></script>
	<script type="text/javascript">

		var availableItemAction = function() {  moveListItem($(this), '#selectedItems', 'selectedItem', selectedItemAction) }
		var selectedItemAction = function() { moveListItem($(this), '#availableItems', 'availableItem', availableItemAction) }

		function moveListItem(clickedElement, listIdToMoveElementTo, newElementInputName, onClickFunctionToAttach) {
			var clickedListItem = clickedElement.clone()
			clickedListItem.find('input').attr('name', newElementInputName)
			clickedListItem.click(onClickFunctionToAttach)
			$(listIdToMoveElementTo).append(clickedListItem)
			clickedElement.remove()
		}

		$('#availableItems li').click(availableItemAction)
		$('#selectedItems li').click(selectedItemAction)
	</script>
</html>