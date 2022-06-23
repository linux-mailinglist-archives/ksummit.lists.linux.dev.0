Return-Path: <ksummit+bounces-701-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3622558BCF
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id C871E2E0A7E
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD629469D;
	Thu, 23 Jun 2022 23:38:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD914697
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:38:35 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id be10so1505213oib.7
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=APDntn1kl7WTM98BqY2wCh1nnB3Kb9MdIOHP2x4USZs=;
        b=Qm16QNtZf+QIiOwEMfQVxUE7vsFclmYaKVqrIPCqkHS6HLh9JCB1KBpiXdjpD/ENQF
         SXErXJ2vHWfOyxQE6NX9fIXlMT/Kl8F+piLE8QBge7onAhtrQYcZ9hxY1C3pVi4ehyTZ
         6+/VPyo8VUL/wSMbsl17jfCuAmjob9Js4wp0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=APDntn1kl7WTM98BqY2wCh1nnB3Kb9MdIOHP2x4USZs=;
        b=1t5NqbHiQKbsktSAL8MMMIJ2t0ETCatHcSG6+PmFdHa9Ooes1n/MiXQpADYT0IXWeS
         ZEbBf8fyY0Iw6ZC+WfJ1A81eImPWrzzOMs9h6piBKfQnafcnMQ5+Apo/VFsdrzDQlew6
         nBAE3XM9a+mt8jDzShxSk5rKd23n5xyJSe+f7WT2vc8K+XPnht2Z87JFXCySsDc9Y2uU
         2X8oSXLHr+DTVtjO/gD8hIrAs7phH9iibHWtOsCH5SVCJ+zoUKSu1u5dNALsHnDnkM/F
         SZdq64qa2xr+xD3T6rwnEGmhANTziW2TzrveMJf61v3dh/VgPEPViPmVKqECLBFK42Sa
         dY3w==
X-Gm-Message-State: AJIora/oCTedQLJ5wghrINr3qzFo+8a6yb456bhTXTu0Wb6tAkZvzEze
	HlS7YRxhAYk843n4t26hcRv4xw==
X-Google-Smtp-Source: AGRyM1tAURj4xt9vHZ5Qh+bQL7CAgR3DXAlSxCbMkeHhnaCRf25ev/f7NjFvyblZ32hLW2hY7bf/rw==
X-Received: by 2002:a05:6808:f92:b0:32f:6e27:6cc7 with SMTP id o18-20020a0568080f9200b0032f6e276cc7mr301488oiw.36.1656027515056;
        Thu, 23 Jun 2022 16:38:35 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id d14-20020a05683025ce00b0060bd52bf77csm632803otu.21.2022.06.23.16.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 16:38:34 -0700 (PDT)
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
 <a3de118e-1ef8-ac79-cf0c-e5e55a1238c8@linuxfoundation.org>
 <YrT3niddXMfuTWnT@pendragon.ideasonboard.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6c4867fb-9020-ba64-427b-556e5f004a27@linuxfoundation.org>
Date: Thu, 23 Jun 2022 17:38:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YrT3niddXMfuTWnT@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/23/22 5:30 PM, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Thu, Jun 23, 2022 at 05:28:09PM -0600, Shuah Khan wrote:
>> On 6/23/22 5:13 PM, Laurent Pinchart wrote:
>>> On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
>>>> I have been debugging a driver probe failure and noticed that driver gets
>>>> registered even when driver probe fails. This is not a new behavior. The
>>>> code in question is the same since 2005.
>>>>
>>>> dmesg will say that a driver probe failed with error code and then the very
>>>> next message from interface core that says driver is registered successfully.
>>>> It will create sysfs interfaces.
>>>>
>>>> The probe failure is propagated from the drive probe routine all the way up to
>>>> __driver_attach(). __driver_attach() ignores the error and and returns success.
>>>>
>>>>            __device_driver_lock(dev, dev->parent);
>>>>            driver_probe_device(drv, dev);
>>>>            __device_driver_unlock(dev, dev->parent);
>>>>
>>>>            return 0;
>>>>
>>>> Interface driver register goes on to create sysfs entries as if driver probe
>>>> worked. It handles errors from driver_register() and unwinds the register
>>>> properly, however in this case it doesn't know about the failure.
>>>>
>>>> At this point the driver is defunct with sysfs interfaces. User has to run
>>>> rmmod to get rid of the defunct driver.
>>>>
>>>> Simply returning the error from __driver_attach() didn't work as expected.
>>>> I figured it would fail since not all interface drivers can handle errors
>>>> from driver probe routines.
>>>>
>>>> I propose that we discuss the scenario to find possible solutions to avoid
>>>> defunct drivers.
>>>
>>> This seems to be the expected behaviour to me. The probe failure doesn't
>>> necessarily indicate that the driver is at fault, it means that
>>> something went wrong when associating a particular device with the
>>> driver. It could be that the device is faulty for instance, and that
>>> shouldn't prevent the driver from being registered, especially if
>>> multiple instances of the device can be present in the system, as that
>>> would then prevent any of those instances from working due to one faulty
>>> device.
>>
>> Agreed. This behavior works well in the cases of hardware/device failures
>> that cause probe failure. The case I am seeing is a driver bug that causes
>> probe failure.
> 
> Is there a way for the kernel to determine that the probe failure was
> caused by a buggy driver and not a faulty device ?
> 

That has to be explored.

>>> What other behaviour would you expect ?
>>
>> I am looking to see if we can propagate the error to the interface driver to
>> handle instead of leaving the defunct driver. This isn't an easy problem to
>> solve though. As you mentioned driver probe could fail if device is bad
>> and we want the driver to handle the others.
>>
>> The fact is we will end up with defunct drivers in some cases. If user notices
>> the error they could go clean it up. My main concern is the sysfs interfaces
>> hanging around. The desired behavior would be not leaving defunct drivers with
>> associated sysfs files.
> 
> I don't think the driver is "defunct". It has been loaded successfully,
> and it's fully operational, just not bound to any device.
> 

Not in the case I am debugging. It won't be successfully bound any device.
That is what I meant by defunct. Maybe there is a better word to use.

The driver releases all resources in its probe failure path.

thanks,
-- Shuah

