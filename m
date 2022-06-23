Return-Path: <ksummit+bounces-698-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9813B558BAC
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F752280C34
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F28A469A;
	Thu, 23 Jun 2022 23:24:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178191FAC
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:24:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id m14so573968plg.5
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GDB1NIY4qv0HRx9A9e0kr32qY8SgBCCsFD7DCTlnXP4=;
        b=YDFIUF5DlxFqz9WMRnzl+tqw7DRcRyEv6LoXNqx+lyBkrszAGu8HbC38XU+OcHXHtO
         wuKfolu6Ajbl18NkmtEbZbXLGTDJ8BurrU/Rcyt9lJjF2XHPQ0W5v375ut1PM2hghNnE
         a15PwuiVMz2vsIwEglxdma+cZMXg75pgimFN78DVDFQwaX7GmQYDPjGeey7OWu7QUUgZ
         pDgiSIoHqrB7rwYWDLhoWqkuY74t/6yuy56N9MWwice4rOKQcYuBpDeFwU51Ln3y8GmY
         TXvhJORBrlYsAbEX5g90j3p23/Yo2pxI8jKaE6ej7dmzIg9bdgNtX3KwJZlab/ZfxXa9
         ondA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GDB1NIY4qv0HRx9A9e0kr32qY8SgBCCsFD7DCTlnXP4=;
        b=i49ZAweao1gOtZpHXBpjz+iZF++x9hgenWBCPd4oac2Lp+AY+NVjrbdC2YvVwHAhq9
         vrakGCRERGYTBNgyhNnIftpZFODpxW6h9kGXYqa1b4xqxOAadQOT4QtF+CeUZlE2edOs
         LDjOPDjBpNzzt3jnPesTDQnTXa8gJNNp7DreNGsLRW5knODab4lt7KL3OFunw0vrW8E8
         z6Af9ln3mSTGLwDtg3WhzoSfciXozqHm25WhYvPT5zEPXT2J2uQpDEdgIiOyEA9Ec6Zo
         wpfWujYXcUGHOlXSoRDPxYVfVe8meQHBYRIAIixeaWR+34MCmM7CRWxHj9GSOFlZ4ljy
         dPwg==
X-Gm-Message-State: AJIora9qu6QS4+KIeguh1S2i5kftZkpW7kXQ0m5ZPhDPbgRIS++9krX0
	V7RRLSouZH9kTtiVpi/XGeIZ4lZNFCo=
X-Google-Smtp-Source: AGRyM1sdXy05Y6TH1c48andtF9NOUKhFroap2c+/GLQngvXqXRkuAdOToXOGbf7SKV0QTQGgupqWiA==
X-Received: by 2002:a17:903:22d0:b0:16a:3039:adc9 with SMTP id y16-20020a17090322d000b0016a3039adc9mr18521706plg.32.1656026652466;
        Thu, 23 Jun 2022 16:24:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8-20020a056a00170800b0050dc762819bsm186362pfc.117.2022.06.23.16.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 16:24:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <febcf31f-074f-56f7-7cb7-7824111e1453@roeck-us.net>
Date: Thu, 23 Jun 2022 16:24:09 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/22 16:05, Shuah Khan wrote:
> I have been debugging a driver probe failure and noticed that driver gets
> registered even when driver probe fails. This is not a new behavior. The
> code in question is the same since 2005.
> 
> dmesg will say that a driver probe failed with error code and then the very
> next message from interface core that says driver is registered successfully.
> It will create sysfs interfaces.
> 
> The probe failure is propagated from the drive probe routine all the way up to
> __driver_attach(). __driver_attach() ignores the error and and returns success.
> 
>          __device_driver_lock(dev, dev->parent);
>          driver_probe_device(drv, dev);
>          __device_driver_unlock(dev, dev->parent);
> 
>          return 0;
> 
> Interface driver register goes on to create sysfs entries as if driver probe
> worked. It handles errors from driver_register() and unwinds the register
> properly, however in this case it doesn't know about the failure.
> 
> At this point the driver is defunct with sysfs interfaces. User has to run
> rmmod to get rid of the defunct driver.
> 
> Simply returning the error from __driver_attach() didn't work as expected.
> I figured it would fail since not all interface drivers can handle errors
> from driver probe routines.
> 
> I propose that we discuss the scenario to find possible solutions to avoid
> defunct drivers.
> 

Doesn't this confuse device probe from loading the driver ? If multiple devices
are instantiated using a single driver, I would not want the driver to unload
because one of the devices it supports failed to probe.

Guenter

