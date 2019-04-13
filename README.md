# body_class

*Takes the classes following the open tag and appends them to the class property on the body element.*

### **Usage**

    {% body_class class anotherclass %}

### Parameters

- Name values space delimited

### Return

- `collection-{collection}`
- `template-{layout}`
- `page-{slug}`
- additional body classes added in tag.

## **Example**


### Input

    {% body_class class anotherclass %}

### **Output**

    <body class="colection-pages template-default page-about class anotherclass">
