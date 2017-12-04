package org.code.jarvis.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.code.jarvis.component.FCMNotification;
import org.code.jarvis.model.core.*;
import org.code.jarvis.model.response.JResponseEntity;
import org.code.jarvis.service.CustomerEntityService;
import org.code.jarvis.service.ProductEntityService;
import org.code.jarvis.service.PromotionEntityService;
import org.code.jarvis.util.Constant;
import org.code.jarvis.util.EntityConvertor;
import org.code.jarvis.util.ResponseFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by KimChheng on 5/13/2017.
 */
@RestController
@RequestMapping("/api/web")
public class WebController {

    private final Logger log = LoggerFactory.getLogger(WebController.class);

    @Autowired
    private ProductEntityService productEntityService;
    @Autowired
    private CustomerEntityService customerEntityService;
    @Autowired
    private PromotionEntityService promotionEntityService;
    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private FCMNotification fcmNotification;

    @ApiOperation(
            httpMethod = "POST",
            value = "Submit product and images",
            notes = "The client have to submit json product and images using form data.",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/product/submit", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public JResponseEntity<String> submitProduct(@RequestPart(required = false) MultipartFile[] files,
                                                 @RequestPart(required = false) String json) {
        try {
            Product product = objectMapper.readValue(json, Product.class);
            productEntityService.saveOrUpdateProduct(files, product);
            fcmNotification.pushNotification("new product", Constant.PRODUCT, Constant.UPDATE, EntityConvertor.getProduct(product));
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("Success", HttpStatus.OK);
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Submit promotion and images",
            notes = "The client have to submit json promotion and images using form data.",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/promotion/submit", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public JResponseEntity<String> submitPromotion(@RequestPart(required = false) MultipartFile[] files,
                                                   @RequestPart(required = false) String json) {
        try {
            Promotion promotion = objectMapper.readValue(json, Promotion.class);
            promotionEntityService.saveOrUpdatePromotion(files, promotion);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("Success", HttpStatus.OK);
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all products",
            notes = "This url does fetch all products",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/product/fetch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> fetchProducts() {
        List list = new ArrayList();
        try {
            log.info("===>>> client request fetch all product");
            list = productEntityService.list(Product.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("Success", HttpStatus.OK, list);
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all promotions",
            notes = "This url does fetch all promotions",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/promotion/fetch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> fetchPromotions(
            @RequestParam(value = "offset", defaultValue = "1", required = false) int offset,
            @RequestParam(value = "limit", defaultValue = "10", required = false) int limit) {

        String count_total = "SELECT COUNT(pro_id) as count FROM td_promotion";
        long count =  productEntityService.getCount(count_total);

        String sql = "SELECT * FROM td_promotion ORDER BY pro_id DESC OFFSET " + ((offset - 1) * limit) + " LIMIT " + limit;
        List<Promotion> promotions = promotionEntityService.getList(sql, Promotion.class);
        JResponseEntity<Object> responseEntity = ResponseFactory.build();

        responseEntity.addBody("COUNT", count);
        responseEntity.addBody(promotions);

        responseEntity.setMessage("Success");
        responseEntity.setStatus(HttpStatus.OK);
        responseEntity.setCode(200);
        return responseEntity;
    }

    @ApiOperation(
            httpMethod = "GET",
            value = "Delete Entity",
            notes = "This url does delete entity from database",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @GetMapping(value = "/entity/delete", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public JResponseEntity<Object> deletePromotion(@RequestParam(value = "id") long id, @RequestParam(value = "type") String type) {
        try {
            log.info("======>>>> client request delete entity");
            AbstractEntity entity = null;
            switch (type) {
                case "CUS":
                    entity = productEntityService.getEntityById(id, Customer.class);
                    break;
                case "PRO":
                    entity = productEntityService.getEntityById(id, Product.class);
                    break;
                case "POM":
                    entity = productEntityService.getEntityById(id, Promotion.class);
                    break;
                case "AD":
                    entity = productEntityService.getEntityById(id, Advertisement.class);
                    break;
                default:
                    break;
            }
            if (entity != null) {
                if (entity instanceof Product) {
                    productEntityService.executeSQL("DELETE FROM td_customer_image WHERE cus_id IN(SELECT cus_id FROM td_customer WHERE pro_id=" + id + ")");
                    productEntityService.executeSQL("DELETE FROM td_customer WHERE pro_id=" + id);
                }
                productEntityService.delete(entity);
                return ResponseFactory.build("Delete entity successful", HttpStatus.OK);
            }

        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("There is no entity with id " + id + " in database!", HttpStatus.BAD_REQUEST);
    }


    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all customers",
            notes = "This url does fetch all customers",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/customer/fetch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> fetchCustomers() {
        List<Customer> list = new ArrayList<>();
        try {
            list = customerEntityService.list(Customer.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("Success", HttpStatus.OK, list);
    }


    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all advertisement",
            notes = "This url does fetch all advertisement",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/advertisement/fetch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> fetchAdvertisement() {
        List<Advertisement> list = new ArrayList<>();
        try {
            list = customerEntityService.list(Advertisement.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
        return ResponseFactory.build("Success", HttpStatus.OK, list);
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Upload image advertisement to server",
            notes = "This url request upload image AD",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PostMapping(value = "/advertisement/submit", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public JResponseEntity<Object> uploadImage(@RequestPart MultipartFile[] files) throws IOException {
        try {
            log.info("Client Upload file advertisement:" + files.length);
            List<Advertisement> response = new ArrayList<>(files.length);
            for (int i = 0; i < files.length; i++) {
                String type = files[i].getContentType();
                if (type.equals(MediaType.IMAGE_JPEG_VALUE) || type.equals(MediaType.IMAGE_PNG_VALUE)) {
                    Image image = new Image();
                    image.setBytes(files[i].getBytes());
                    image.setName(files[i].getOriginalFilename());
                    image.setType(type);
                    Advertisement advertisement = new Advertisement();
                    //advertisement.setCreateDate(new Date());
                    //advertisement.setUpdateDate(new Date());
                    advertisement.setImage(image);
                    productEntityService.saveOrUpdate(advertisement);
                    response.add(advertisement);
                }
            }
            fcmNotification.pushNotification("Submit advertisement successful", Constant.ADVERTISEMENT, Constant.NEW, EntityConvertor.getAdvertisement(response));
            return ResponseFactory.build("Submit advertisement successful", HttpStatus.OK, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ResponseFactory.build("No files were upload", HttpStatus.BAD_REQUEST);
    }

    @ApiOperation(
            httpMethod = "GET",
            value = "View image from server",
            notes = "This url request to server for view image",
            response = HttpEntity.class)
    @GetMapping(value = "/image/view/{id}", produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE})
    public HttpEntity<byte[]> viewImage(@PathVariable(name = "id", required = true) long id) throws IOException {
        log.info("Client Requested picture Id:" + id);
        Image image = productEntityService.getEntityById(id, Image.class);
        if (image != null) {
            byte[] bytes = image.getBytes();
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Disposition", "inline; filename=\"" + image.getName() + "\"");
            headers.set("Content-Type", image.getType());
            headers.setContentLength(bytes.length);
            return new HttpEntity<>(bytes, headers);
        }
        return null;
    }

    @ApiOperation(
            httpMethod = "GET",
            value = "Download image from server",
            notes = "This url request to server for download image",
            response = HttpEntity.class)
    @GetMapping(value = "/image/download/{id}", produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE})
    public HttpEntity<byte[]> downloadImage(@PathVariable(name = "id", required = true) long id) throws IOException {
        log.info("Client Requested download picture Id:" + id);
        Image image = productEntityService.getEntityById(id, Image.class);
        if (image != null) {
            byte[] bytes = image.getBytes();
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Disposition", "attachment; filename=\"" + image.getName() + "\"");
            headers.set("Content-Type", image.getType());
            headers.setContentLength(bytes.length);
            return new HttpEntity<>(bytes, headers);
        }
        return null;
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Add image to entity",
            notes = "This url request to server to add image",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @PostMapping(value = "/image/add", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public JResponseEntity<Object> addImage(@RequestParam(value = "key") String key, @RequestParam(value = "files") MultipartFile[] files) throws IOException {
        try {
            String[] value = key.split("-");
            Object entity = null;
            List<Image> images = null;
            List<Long> response = new ArrayList<>();
            log.info("Client Requested add " + files.length + " picture");
            log.info("Entity " + value[1]);
            switch (value[1]) {
                case "POM":
                    entity = productEntityService.getEntityById(new Long(value[0]), Promotion.class);
                    if (entity != null)
                        images = ((Promotion) entity).getImages();
                    break;
                case "PRO":
                    entity = productEntityService.getEntityById(new Long(value[0]), Product.class);
                    if (entity != null)
                        images = ((Product) entity).getImages();
                    break;
                default:
                    break;
            }
            if (entity != null) {
                if (images != null) {
                    for (int i = 0; i < files.length; i++) {
                        String type = files[i].getContentType();
                        if (type.equals(MediaType.IMAGE_JPEG_VALUE) || type.equals(MediaType.IMAGE_PNG_VALUE)) {
                            Image image = new Image();
                            image.setBytes(files[i].getBytes());
                            image.setName(files[i].getOriginalFilename());
                            image.setType(type);
                            productEntityService.saveOrUpdate(image);
                            response.add(image.getId());
                            images.add(image);
                        }
                    }
                }
                productEntityService.saveOrUpdate(entity);
            }
            return ResponseFactory.build("Upload image to server success", HttpStatus.OK, response);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @ApiOperation(
            httpMethod = "GET",
            value = "Delete image from server",
            notes = "This url request to server to delete image",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @GetMapping(value = "/image/delete/{id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public JResponseEntity<Object> deleteImage(@PathVariable(name = "id") long id) throws IOException {
        try {
            log.info("Client Requested delete picture Id:" + id);
            productEntityService.executeSQL("DELETE FROM td_product_image WHERE img_id=" + id);
            productEntityService.executeSQL("DELETE FROM td_promotion_image WHERE img_id=" + id);
            productEntityService.executeSQL("DELETE FROM td_advertisement WHERE img_id=" + id);
            productEntityService.executeSQL("DELETE FROM td_image WHERE img_id=" + id);
            return ResponseFactory.build("Delete image success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseFactory.build("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @ApiOperation(
            httpMethod = "GET",
            value = "Push notification to client",
            notes = "This url request to server to push notify item deleted to client")
    @GetMapping(value = "/item_deleted")
    public void pushNotification(@RequestParam(value = "id") long id, @RequestParam(value = "type") String type) {
        try {
            fcmNotification.pushNotification("item deleted", type, Constant.DELETE, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all products",
            notes = "This url does fetch all products",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/products/fetch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> getProducts(
            @RequestParam(value = "offset", defaultValue = "1", required = false) int offset,
            @RequestParam(value = "limit", defaultValue = "10", required = false) int limit) {

        String count_total = "SELECT COUNT(pro_id) as count FROM td_product";
        long count = productEntityService.getCount(count_total);

        String sql = "SELECT * FROM td_product ORDER BY pro_id DESC OFFSET " + ((offset - 1) * limit) + " LIMIT " + limit;
        List<Product> products = productEntityService.getList(sql, Product.class);

        JResponseEntity<Object> responseEntity = ResponseFactory.build();
        responseEntity.addBody(products);
        responseEntity.addBody("COUNT", count);
        responseEntity.setCode(200);
        responseEntity.setStatus(HttpStatus.OK);
        responseEntity.setMessage("SUCCESS");
        return responseEntity;
    }

    @ApiOperation(
            httpMethod = "POST",
            value = "Fetch all products",
            notes = "This url does fetch all products",
            response = JResponseEntity.class,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiResponses(value = {
            @ApiResponse(code = 401, message = "Unauthorized"),
            @ApiResponse(code = 403, message = "Forbidden"),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Internal Server Error")})
    @PostMapping(value = "/products/fetch/type", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public JResponseEntity<Object> getProductsByProductType(
            @RequestParam(value = "type", defaultValue = "DES", required = false) String type,
            @RequestParam(value = "offset", defaultValue = "1", required = false) int offset,
            @RequestParam(value = "limit", defaultValue = "10", required = false) int limit) {

        /*String count_total = "SELECT COUNT(pro_id) as count FROM td_product WHERE TYPE = " + type;
        long count = productEntityService.executeSQL(count_total);*/

        String sql = "SELECT * FROM td_product WHERE pro_type = '" + type + "' ORDER BY pro_id DESC OFFSET " + ((offset - 1) * limit) + " LIMIT " + limit;
        //SELECT * from td_product WHERE pro_type = 'DES''" + userName + "'
        Product productsType = productEntityService.getSingle(sql, Product.class);

        JResponseEntity<Object> responseEntity = ResponseFactory.build();
        responseEntity.addBody(productsType);
        //responseEntity.addBody("COUNT", count);
        responseEntity.setCode(200);
        responseEntity.setStatus(HttpStatus.OK);
        responseEntity.setMessage("SUCCESS");
        return responseEntity;
    }

}
