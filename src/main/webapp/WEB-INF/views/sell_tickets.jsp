<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>stadiumticket - sell tickets for event</title>
    <!-- css -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/bootstrap-theme.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/jquery.dataTables.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/datetimepicker.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/main.css" rel="stylesheet">

    <!-- js -->
    <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.dataTables.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.maphighlight.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/datetimepicker.js"></script>
    <script src="<%= request.getContextPath() %>/js/main.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
<div class="row">
    <div class="col-xs-1 col-md-1"><a href="index.html"><img class="img-responsive" src="<%= request.getContextPath() %>/images/logo.png"></a></div>
    <div class="col-xs-6 col-md-9">
        <h3>
            <a id="arrow_back" href="index.html"><img src="<%= request.getContextPath() %>/images/arrow_back.png"></a>&nbsp;Events
        </h3>

        <h2 id="event_name"><c:out value="${event.eventName}"></c:out></h2>
    </div>
</div>
<div class="row">
<div class="col-md-5">
    <form action="" method="post">
        <b>Ticket(s):</b>
        <table class="table" id="ticket_list">
            <thead>
            <tr>
                <td>№</td>
                <td>Sector</td>
                <td>Row</td>
                <td>Seat</td>
                <td>Price</td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="4"><b>Total price:</b></td>
                <td id="total_price"></td>
                <td>UAH</td>
            </tr>
            </tfoot>
        </table>
        <br>
        <!-- <input class="btn" type="button" id="add_random_ticket" value="add random ticket"> -->
        <input class="btn" type="submit" name="submit" value="Sell tickets" id="book_tickets">
    </form>

</div>
<div class="col-md-7">
    <img id="new_event_img" class="map" usemap="#stadium" src="<%= request.getContextPath() %>/images/stadium_plan.png">
    <map id="disable_inputs" name="stadium">
      <input type="text" name="price_26" id="price_26" size="4" maxlength="4" value="150">
      <area id="26" alt="vipD" title="vipD" href="" shape="rect" coords="152,472,468,501"/>

      <input type="text" name="price_27" id="price_27" size="4" maxlength="4" value="150">
      <area id="27" alt="vipA" title="vipA" href="" shape="rect" coords="266,32,356,83"/>

      <input type="text" name="price_1" id="price_1" size="4" maxlength="4" value="150">
      <area id="1" alt="1" title="1" href="" shape="poly"
            coords="320,93,364,92,364,54,364,33,436,34,437,47,422,47,423,119,384,120,384,108,321,110"/>

      <input type="text" name="price_2" id="price_2" size="4" maxlength="4" value="150">
      <area id="2" alt="2" title="2" href="" shape="poly"
            coords="431,119,431,53,446,53,446,20,485,20,520,29,478,117"/>

      <input type="text" name="price_3" id="price_3" size="4" maxlength="4" value="150">
      <area id="3" alt="3" title="3" href="" shape="poly" coords="485,122,526,32,564,55,586,92,497,137"/>

      <input type="text" name="price_4" id="price_4" size="4" maxlength="4" value="150">
      <area id="4" alt="4" title="4" href="" shape="poly" coords="509,136,590,103,601,162,512,163"/>

      <input type="text" name="price_5" id="price_5" size="4" maxlength="4" value="150">
      <area id="5" alt="5" title="5" href="" shape="rect" coords="500,166,602,218"/>

      <input type="text" name="price_6" id="price_6" size="4" maxlength="4" value="150">
      <area id="6" alt="6" title="6" href="" shape="rect" coords="499,222,603,278"/>

      <input type="text" name="price_7" id="price_7" size="4" maxlength="4" value="150">
      <area id="7" alt="7" title="7" href="" shape="rect" coords="498,284,602,332"/>

      <input type="text" name="price_8" id="price_8" size="4" maxlength="4" value="150">
      <area id="8" alt="8" title="8" href="" shape="poly" coords="501,340,565,339,562,383,501,361"/>

      <input type="text" name="price_9" id="price_9" size="4" maxlength="4" value="150">
      <area id="9" alt="9" title="9" href="" shape="poly" coords="486,378,498,364,559,389,541,418,511,438"/>

      <input type="text" name="price_10" id="price_10" size="4" maxlength="4" value="150">
      <area id="10" alt="10" title="10" href="" shape="poly"
            coords="458,382,482,381,514,470,472,482,463,461,458,443"/>

      <input type="text" name="price_11" id="price_11" size="4" maxlength="4" value="150">
      <area id="11" alt="11" title="11" href="" shape="rect" coords="398,380,453,467"/>

      <input type="text" name="price_12" id="price_12" size="4" maxlength="4" value="150">
      <area id="12" alt="12" title="12" href="" shape="rect" coords="341,380,395,467"/>

      <input type="text" name="price_13" id="price_13" size="4" maxlength="4" value="150">
      <area id="13" alt="13" title="13" href="" shape="rect" coords="285,381,336,468"/>

      <input type="text" name="price_14" id="price_14" size="4" maxlength="4" value="150">
      <area id="14" alt="14" title="14" href="" shape="rect" coords="227,381,278,468"/>

      <input type="text" name="price_15" id="price_15" size="4" maxlength="4" value="150">
      <area id="15" alt="15" title="15" href="" shape="rect" coords="169,382,220,469"/>

      <input type="text" name="price_16" id="price_16" size="4" maxlength="4" value="150">
      <area id="16" alt="16" title="16" href="" shape="poly"
            coords="144,381,163,382,163,464,154,467,151,482,105,472"/>

      <input type="text" name="price_17" id="price_17" size="4" maxlength="4" value="150">
      <area id="17" alt="17" title="17" href="" shape="poly" coords="35,406,126,366,138,377,100,470,61,445"/>

      <input type="text" name="price_18" id="price_18" size="4" maxlength="4" value="150">
      <area id="18" alt="18" title="18" href="" shape="poly" coords="21,343,123,340,123,361,33,399,26,375"/>

      <input type="text" name="price_19" id="price_19" size="4" maxlength="4" value="150">
      <area id="19" alt="19" title="19" href="" shape="rect" coords="23,282,124,333"/>

      <input type="text" name="price_20" id="price_20" size="4" maxlength="4" value="150">
      <area id="20" alt="20" title="20" href="" shape="rect" coords="22,224,123,275"/>

      <input type="text" name="price_21" id="price_21" size="4" maxlength="4" value="150">
      <area id="21" alt="21" title="21" href="" shape="rect" coords="22,167,123,218"/>

      <input type="text" name="price_22" id="price_22" size="4" maxlength="4" value="150">
      <area id="22" alt="22" title="22" href="" shape="poly" coords="31,103,123,141,123,160,23,161,24,130"/>

      <input type="text" name="price_23" id="price_23" size="4" maxlength="4" value="150">
      <area id="23" alt="23" title="23" href="" shape="poly" coords="35,95,60,59,97,33,139,122,125,134"/>

      <input type="text" name="price_24" id="price_24" size="4" maxlength="4" value="150">
      <area id="24" alt="24" title="24" href="" shape="poly"
            coords="105,29,141,19,178,17,178,52,191,54,192,119,145,120"/>

      <input type="text" name="price_25" id="price_25" size="4" maxlength="4" value="150">
      <area id="25" alt="25" title="25" href="" shape="poly"
            coords="186,32,263,33,266,47,259,46,261,92,303,93,304,109,241,109,238,120,202,119,201,56,201,46,185,46"/>
    </map>
</div>
</div>
</div>
<br/>

<div class="container seats">
<table class="table table-condensed table-responsive sell_tickets_header">
    <tbody>
    <tr>
        <td id="sector_name">Sector VIP A seats:</td>
        <td><div>42</div></td>
        <td>Vacant</td>
        <td><div>42</div></td>
        <td>Booked</td>
        <td><div>42</div></td>
        <td>Occupied</td>
    </tr>
    </tbody>
</table>
<hr>
<div class="table-responsive">
<table class="table table-condensed table-responsive sell_tickets_table">
<tbody>
<tr>
    <td><div>1</div></td>
    <td id="1_1"><div>1</div></td>
    <td id="1_2"><div>2</div></td>
    <td id="1_3"><div>3</div></td>
    <td id="1_4"><div>4</div></td>
    <td id="1_5"><div>5</div></td>
    <td id="1_6"><div>6</div></td>
    <td id="1_7"><div>7</div></td>
    <td id="1_8"><div>8</div></td>
    <td id="1_9"><div>9</div></td>
    <td id="1_10"><div>10</div></td>
    <td id="1_11"><div>11</div></td>
    <td id="1_12"><div>12</div></td>
    <td id="1_13"><div>13</div></td>
    <td id="1_14"><div>14</div></td>
    <td id="1_15"><div>15</div></td>
    <td id="1_16"><div>16</div></td>
    <td id="1_17"><div>17</div></td>
    <td id="1_18"><div>18</div></td>
    <td id="1_19"><div>19</div></td>
    <td id="1_20"><div>20</div>
</tr>
<tr>
    <td><div>2</div></td>
    <td id="2_1"><div>1</div></td>
    <td id="2_2"><div>2</div></td>
    <td id="2_3"><div>3</div></td>
    <td id="2_4"><div>4</div></td>
    <td id="2_5"><div>5</div></td>
    <td id="2_6"><div>6</div></td>
    <td id="2_7"><div>7</div></td>
    <td id="2_8"><div>8</div></td>
    <td id="2_9"><div>9</div></td>
    <td id="2_10"><div>10</div></td>
    <td id="2_11"><div>11</div></td>
    <td id="2_12"><div>12</div></td>
    <td id="2_13"><div>13</div></td>
    <td id="2_14"><div>14</div></td>
    <td id="2_15"><div>15</div></td>
    <td id="2_16"><div>16</div></td>
    <td id="2_17"><div>17</div></td>
    <td id="2_18"><div>18</div></td>
    <td id="2_19"><div>19</div></td>
    <td id="2_20"><div>20</div>
</tr>
<tr>
    <td><div>3</div></td>
    <td id="3_1"><div>1</div></td>
    <td id="3_2"><div>2</div></td>
    <td id="3_3"><div>3</div></td>
    <td id="3_4"><div>4</div></td>
    <td id="3_5"><div>5</div></td>
    <td id="3_6"><div>6</div></td>
    <td id="3_7"><div>7</div></td>
    <td id="3_8"><div>8</div></td>
    <td id="3_9"><div>9</div></td>
    <td id="3_10"><div>10</div></td>
    <td id="3_11"><div>11</div></td>
    <td id="3_12"><div>12</div></td>
    <td id="3_13"><div>13</div></td>
    <td id="3_14"><div>14</div></td>
    <td id="3_15"><div>15</div></td>
    <td id="3_16"><div>16</div></td>
    <td id="3_17"><div>17</div></td>
    <td id="3_18"><div>18</div></td>
    <td id="3_19"><div>19</div></td>
    <td id="3_20"><div>20</div>
</tr>
<tr>
    <td><div>4</div></td>
    <td id="4_1"><div>1</div></td>
    <td id="4_2"><div>2</div></td>
    <td id="4_3"><div>3</div></td>
    <td id="4_4"><div>4</div></td>
    <td id="4_5"><div>5</div></td>
    <td id="4_6"><div>6</div></td>
    <td id="4_7"><div>7</div></td>
    <td id="4_8"><div>8</div></td>
    <td id="4_9"><div>9</div></td>
    <td id="4_10"><div>10</div></td>
    <td id="4_11"><div>11</div></td>
    <td id="4_12"><div>12</div></td>
    <td id="4_13"><div>13</div></td>
    <td id="4_14"><div>14</div></td>
    <td id="4_15"><div>15</div></td>
    <td id="4_16"><div>16</div></td>
    <td id="4_17"><div>17</div></td>
    <td id="4_18"><div>18</div></td>
    <td id="4_19"><div>19</div></td>
    <td id="4_20"><div>20</div>
</tr>
<tr>
    <td><div>5</div></td>
    <td id="5_1"><div>1</div></td>
    <td id="5_2"><div>2</div></td>
    <td id="5_3"><div>3</div></td>
    <td id="5_4"><div>4</div></td>
    <td id="5_5"><div>5</div></td>
    <td id="5_6"><div>6</div></td>
    <td id="5_7"><div>7</div></td>
    <td id="5_8"><div>8</div></td>
    <td id="5_9"><div>9</div></td>
    <td id="5_10"><div>10</div></td>
    <td id="5_11"><div>11</div></td>
    <td id="5_12"><div>12</div></td>
    <td id="5_13"><div>13</div></td>
    <td id="5_14"><div>14</div></td>
    <td id="5_15"><div>15</div></td>
    <td id="5_16"><div>16</div></td>
    <td id="5_17"><div>17</div></td>
    <td id="5_18"><div>18</div></td>
    <td id="5_19"><div>19</div></td>
    <td id="5_20"><div>20</div>
</tr>
<tr>
    <td><div>6</div></td>
    <td id="6_1"><div>1</div></td>
    <td id="6_2"><div>2</div></td>
    <td id="6_3"><div>3</div></td>
    <td id="6_4"><div>4</div></td>
    <td id="6_5"><div>5</div></td>
    <td id="6_6"><div>6</div></td>
    <td id="6_7"><div>7</div></td>
    <td id="6_8"><div>8</div></td>
    <td id="6_9"><div>9</div></td>
    <td id="6_10"><div>10</div></td>
    <td id="6_11"><div>11</div></td>
    <td id="6_12"><div>12</div></td>
    <td id="6_13"><div>13</div></td>
    <td id="6_14"><div>14</div></td>
    <td id="6_15"><div>15</div></td>
    <td id="6_16"><div>16</div></td>
    <td id="6_17"><div>17</div></td>
    <td id="6_18"><div>18</div></td>
    <td id="6_19"><div>19</div></td>
    <td id="6_20"><div>20</div>
</tr>
<tr>
    <td><div>7</div></td>
    <td id="7_1"><div>1</div></td>
    <td id="7_2"><div>2</div></td>
    <td id="7_3"><div>3</div></td>
    <td id="7_4"><div>4</div></td>
    <td id="7_5"><div>5</div></td>
    <td id="7_6"><div>6</div></td>
    <td id="7_7"><div>7</div></td>
    <td id="7_8"><div>8</div></td>
    <td id="7_9"><div>9</div></td>
    <td id="7_10"><div>10</div></td>
    <td id="7_11"><div>11</div></td>
    <td id="7_12"><div>12</div></td>
    <td id="7_13"><div>13</div></td>
    <td id="7_14"><div>14</div></td>
    <td id="7_15"><div>15</div></td>
    <td id="7_16"><div>16</div></td>
    <td id="7_17"><div>17</div></td>
    <td id="7_18"><div>18</div></td>
    <td id="7_19"><div>19</div></td>
    <td id="7_20"><div>20</div>
</tr>
<tr>
    <td><div>8</div></td>
    <td id="8_1"><div>1</div></td>
    <td id="8_2"><div>2</div></td>
    <td id="8_3"><div>3</div></td>
    <td id="8_4"><div>4</div></td>
    <td id="8_5"><div>5</div></td>
    <td id="8_6"><div>6</div></td>
    <td id="8_7"><div>7</div></td>
    <td id="8_8"><div>8</div></td>
    <td id="8_9"><div>9</div></td>
    <td id="8_10"><div>10</div></td>
    <td id="8_11"><div>11</div></td>
    <td id="8_12"><div>12</div></td>
    <td id="8_13"><div>13</div></td>
    <td id="8_14"><div>14</div></td>
    <td id="8_15"><div>15</div></td>
    <td id="8_16"><div>16</div></td>
    <td id="8_17"><div>17</div></td>
    <td id="8_18"><div>18</div></td>
    <td id="8_19"><div>19</div></td>
    <td id="8_20"><div>20</div>
</tr>
<tr>
    <td><div>9</div></td>
    <td id="9_1"><div>1</div></td>
    <td id="9_2"><div>2</div></td>
    <td id="9_3"><div>3</div></td>
    <td id="9_4"><div>4</div></td>
    <td id="9_5"><div>5</div></td>
    <td id="9_6"><div>6</div></td>
    <td id="9_7"><div>7</div></td>
    <td id="9_8"><div>8</div></td>
    <td id="9_9"><div>9</div></td>
    <td id="9_10"><div>10</div></td>
    <td id="9_11"><div>11</div></td>
    <td id="9_12"><div>12</div></td>
    <td id="9_13"><div>13</div></td>
    <td id="9_14"><div>14</div></td>
    <td id="9_15"><div>15</div></td>
    <td id="9_16"><div>16</div></td>
    <td id="9_17"><div>17</div></td>
    <td id="9_18"><div>18</div></td>
    <td id="9_19"><div>19</div></td>
    <td id="9_20"><div>20</div>
</tr>
<tr>
    <td><div>10</div></td>
    <td id="10_1"><div>1</div></td>
    <td id="10_2"><div>2</div></td>
    <td id="10_3"><div>3</div></td>
    <td id="10_4"><div>4</div></td>
    <td id="10_5"><div>5</div></td>
    <td id="10_6"><div>6</div></td>
    <td id="10_7"><div>7</div></td>
    <td id="10_8"><div>8</div></td>
    <td id="10_9"><div>9</div></td>
    <td id="10_10"><div>10</div></td>
    <td id="10_11"><div>11</div></td>
    <td id="10_12"><div>12</div></td>
    <td id="10_13"><div>13</div></td>
    <td id="10_14"><div>14</div></td>
    <td id="10_15"><div>15</div></td>
    <td id="10_16"><div>16</div></td>
    <td id="10_17"><div>17</div></td>
    <td id="10_18"><div>18</div></td>
    <td id="10_19"><div>19</div></td>
    <td id="10_20"><div>20</div>
</tr>
</tbody>
</table>
</div>

</div>
<br/>
</body>
</html>
