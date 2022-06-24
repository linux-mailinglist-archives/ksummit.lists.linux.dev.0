Return-Path: <ksummit+bounces-703-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261DC558C8A
	for <lists@lfdr.de>; Fri, 24 Jun 2022 03:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42EBE280C10
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AC21FB8;
	Fri, 24 Jun 2022 01:00:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620A7C
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 01:00:10 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so1291706pjv.3
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 18:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fnn2IZtYnAWYb9B2GrM71SKEbTVJ4sARPcq51Ffqg8s=;
        b=MxPBXKljBDVv2/nvyazjqWiylzy1OXVqjde6iJt06mkQTMZjsPcQwtE1Vxs3/Z7Fa7
         5yBLWIv24fSniwIzAniTwSzmY38XNsXJl0OB/P1/7sP7qN6cClfx2AyahsITlolTQMc3
         DBtV0b6VeXP+un+6EKNQ8/0Ofx3bIZ1pv+8r/lgh2W8x7gtkDIpPLS+HJiopn6aUVt4K
         rOpPTxUQ5j6I2t5vmzZ02YFpiDfJ1pnU6bVk4xYQfONYHYISx/59xQURd1qQ4zTCLJk5
         DXzexwpKwePs01lUK4vyXafKHw0uvngRCDjPs1zFzutvnAIa9tKm3ZUzNeNIyWRGWCsG
         koSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fnn2IZtYnAWYb9B2GrM71SKEbTVJ4sARPcq51Ffqg8s=;
        b=obUOAWCeVKto71su31Zu3zFvc6USlkUifjls5OvOnkERkKBFTXbawLNvbyqr/JGX2b
         795U4GwbgK2Ho+Ql/zjEz2vlA4sVRigcS2T3/2UGmcg2yguTsSimUEQHZJX7L1Yxqs7O
         ICvrI0dMGYQTcQWr6H9tmT7n0nQ/IwEZN/2bbM6MhWHbftElQDhE4tU112IpXAAq4ho3
         g8lSwVrSAbjEHfgaCkO3QZRGQ+VCVoux1cdC7IP1XjKFRjNkLMA2t8OTLnfwGAejG9xD
         EzLn7aX2H45PX6XgWvQ/yrFiDu5ZYVgE6HU5YXxelhGCRykJhqXhTyiQadKhbjWf3r+w
         rlMA==
X-Gm-Message-State: AJIora+uJBXsuqDoYhJ40qQH1iCPg1Z/rBw+P2EWC0M7Aa3FdXvzAW2y
	T9VVBwzGMLH/Y2JZWY9BOf4=
X-Google-Smtp-Source: AGRyM1vFTxg4Y9ZhRxtmVppbzCnetd110pdWQFAWyc9oqKZwq28OvdRJHQA/IfDFaaW3fZLBnXpeNw==
X-Received: by 2002:a17:90a:fd13:b0:1ec:7a40:3b5 with SMTP id cv19-20020a17090afd1300b001ec7a4003b5mr847228pjb.8.1656032409942;
        Thu, 23 Jun 2022 18:00:09 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:96d9:dda4:3142:7c7a])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902a38400b0015e8d4eb1easm421354pla.52.2022.06.23.18.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 18:00:08 -0700 (PDT)
Date: Thu, 23 Jun 2022 18:00:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
Message-ID: <YrUMlki+cJkJ3R/X@google.com>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
 <a3de118e-1ef8-ac79-cf0c-e5e55a1238c8@linuxfoundation.org>
 <YrT3niddXMfuTWnT@pendragon.ideasonboard.com>
 <6c4867fb-9020-ba64-427b-556e5f004a27@linuxfoundation.org>
 <62b4fdd7c4183_8070294ad@dwillia2-xfh.notmuch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b4fdd7c4183_8070294ad@dwillia2-xfh.notmuch>

On Thu, Jun 23, 2022 at 04:57:11PM -0700, Dan Williams wrote:
> Shuah Khan wrote:
> > On 6/23/22 5:30 PM, Laurent Pinchart wrote:
> > > Hi Shuah,
> > > 
> > > On Thu, Jun 23, 2022 at 05:28:09PM -0600, Shuah Khan wrote:
> > >> On 6/23/22 5:13 PM, Laurent Pinchart wrote:
> > >>> On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
> > >>>> I have been debugging a driver probe failure and noticed that driver gets
> > >>>> registered even when driver probe fails. This is not a new behavior. The
> > >>>> code in question is the same since 2005.
> > >>>>
> > >>>> dmesg will say that a driver probe failed with error code and then the very
> > >>>> next message from interface core that says driver is registered successfully.
> > >>>> It will create sysfs interfaces.
> > >>>>
> > >>>> The probe failure is propagated from the drive probe routine all the way up to
> > >>>> __driver_attach(). __driver_attach() ignores the error and and returns success.
> > >>>>
> > >>>>            __device_driver_lock(dev, dev->parent);
> > >>>>            driver_probe_device(drv, dev);
> > >>>>            __device_driver_unlock(dev, dev->parent);
> > >>>>
> > >>>>            return 0;
> > >>>>
> > >>>> Interface driver register goes on to create sysfs entries as if driver probe
> > >>>> worked. It handles errors from driver_register() and unwinds the register
> > >>>> properly, however in this case it doesn't know about the failure.
> > >>>>
> > >>>> At this point the driver is defunct with sysfs interfaces. User has to run
> > >>>> rmmod to get rid of the defunct driver.
> > >>>>
> > >>>> Simply returning the error from __driver_attach() didn't work as expected.
> > >>>> I figured it would fail since not all interface drivers can handle errors
> > >>>> from driver probe routines.
> > >>>>
> > >>>> I propose that we discuss the scenario to find possible solutions to avoid
> > >>>> defunct drivers.
> > >>>
> > >>> This seems to be the expected behaviour to me. The probe failure doesn't
> > >>> necessarily indicate that the driver is at fault, it means that
> > >>> something went wrong when associating a particular device with the
> > >>> driver. It could be that the device is faulty for instance, and that
> > >>> shouldn't prevent the driver from being registered, especially if
> > >>> multiple instances of the device can be present in the system, as that
> > >>> would then prevent any of those instances from working due to one faulty
> > >>> device.
> > >>
> > >> Agreed. This behavior works well in the cases of hardware/device failures
> > >> that cause probe failure. The case I am seeing is a driver bug that causes
> > >> probe failure.
> > > 
> > > Is there a way for the kernel to determine that the probe failure was
> > > caused by a buggy driver and not a faulty device ?
> > > 
> > 
> > That has to be explored.
> > 
> > >>> What other behaviour would you expect ?
> > >>
> > >> I am looking to see if we can propagate the error to the interface driver to
> > >> handle instead of leaving the defunct driver. This isn't an easy problem to
> > >> solve though. As you mentioned driver probe could fail if device is bad
> > >> and we want the driver to handle the others.
> > >>
> > >> The fact is we will end up with defunct drivers in some cases. If user notices
> > >> the error they could go clean it up. My main concern is the sysfs interfaces
> > >> hanging around. The desired behavior would be not leaving defunct drivers with
> > >> associated sysfs files.
> > > 
> > > I don't think the driver is "defunct". It has been loaded successfully,
> > > and it's fully operational, just not bound to any device.
> > > 
> > 
> > Not in the case I am debugging. It won't be successfully bound any device.
> > That is what I meant by defunct. Maybe there is a better word to use.
> > 
> > The driver releases all resources in its probe failure path.
> 
> If the driver is bad there is no way for the kernel to know.
> 
> Are you perhaps looking for a technique to unload the driver if another
> driver knows that it is indeed ok to unload the driver if it does not
> attach to its intended device?
> 
> You mention the interface driver getting involved. The interface driver
> could do something like:
> 
>     device_add(dev);
>     device_lock(dev);
>     if (!dev->driver)
>         driver_unregister(drv);
>     device_unlock(dev);
> 
> ...but that would need to know that nothing else needs @drv and that
> @drv has been registered and ->probe() run synchronous with
> device_add(). That does not work with the async and deferred probing
> options.

Nor does this work for drivers for devices that might be hot-plugged,
instantiated via sysfs/new_id, etc, etc.

So if you want to fail driver registration because you know that you are
dealing with a singleton platform device with no additional dependencies
then it has to be done in the driver itself, not by the driver core.

Thanks.

-- 
Dmitry

