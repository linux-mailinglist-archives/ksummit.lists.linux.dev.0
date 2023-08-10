Return-Path: <ksummit+bounces-958-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A992777C8C
	for <lists@lfdr.de>; Thu, 10 Aug 2023 17:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2A8E282181
	for <lists@lfdr.de>; Thu, 10 Aug 2023 15:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3678E20CA9;
	Thu, 10 Aug 2023 15:47:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76496200BC
	for <ksummit@lists.linux.dev>; Thu, 10 Aug 2023 15:47:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 4A62B320085B;
	Thu, 10 Aug 2023 11:47:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 10 Aug 2023 11:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691682426; x=1691768826; bh=u0
	Na+s3HFCBhMXiFY6l2ucQ2gOuz/YN8Uo6nPtVtE4A=; b=QxIxbMhfa409X5Xy1l
	pJKiASHLtQ2zp8PEsGsVJrPdq2XZgHB3t1kFkVXKaSRGEUGh0xtEpxqbESZUQe9C
	YKZIuo/l02kaDD6SoNS9fZpislhUfSL80shBhyOZ1QX0z4Ke+hKS1UwCE7ZOUlxk
	3/HNn7IK84+xrFH4znzo2N7rchNdkWap6lavjj3Nq15fuSP+71zznerSe+fgUWk/
	S8855PQx325ugcHzm0VzCirkwPoGKjlflXq1CkCr6OOC7Xabc+3P3qVTdQep9FmS
	9rSwx3/N7Qrk3+buj/yGDS83HT0uTgrn0RTtuGko7ZeeTSwq4lmnsxBut3fVrzrk
	8neA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691682426; x=1691768826; bh=u0Na+s3HFCBhM
	XiFY6l2ucQ2gOuz/YN8Uo6nPtVtE4A=; b=va6m7jYEiCXrTglso0A4srhCpornN
	eYnL2bsTLDsfbpDG6e0NQ3ZKfJAzbbliRIWXa+pmM43ukxvoTzDchjTVTKkjqoLJ
	UHAtlEATICv4C1XLeGj5VI4gbs4bwPUIoOVgZNvDUgEP0V4sYxFawMbuM/Hi/SKs
	oDOpekYY6InaDV3dZIr1s04uTgcuzAjoIyJJ4043MGgywbQQqVETHFilXGGqDnuo
	Dj+T+x/njrf4O8JZIL23monMnhJGPzdc4Hftkcxuf1uZRviL7AVTHTR+z11ZwxBh
	zNRTB+tWb0si8ACu1T3AgidCAYGOQxOqrWKcqpABl+a37t+uELaLsvqQQ==
X-ME-Sender: <xms:egbVZO-rokpAuow0Zd74LsbRE42e5xur9c-dzoVAqpLWr1N87YAz5g>
    <xme:egbVZOsKBvhvW8V_CfvfwimstoaNZfu-EVHGViThSHleNVOf_-zqDcnuUj7FdZK_c
    9D_w0j-HVYSmA>
X-ME-Received: <xmr:egbVZEAgZtpRInfhS28Yfc2dDUkFCMgzdW1O5LJ44jGkb1U8CWGnBYNqtVW3ns9mUr9uM1IxOzTd-uOv5prUA9eRaMhV2iTncKZqoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:egbVZGenWD43y6uSsygMYLSGpqec12jN9vE9AohrjKhR6Fwz_r8x3A>
    <xmx:egbVZDOVXRMPb8T6ZXLVqvyk6mqrTojZZA3Sk78Z5LMArHaJbV4hQQ>
    <xmx:egbVZAn1zpiJ55CQWhYYfDNzffcR73bzpvUQnCNYsQDPmQst8a_GIQ>
    <xmx:egbVZMb15Jiknqu5sMmU2oUvX1yaVhmca9-x5vMQgdRkTcgJ6IJzAg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:47:05 -0400 (EDT)
Date: Thu, 10 Aug 2023 17:47:02 +0200
From: Greg KH <greg@kroah.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
Message-ID: <2023081048-skittle-excusable-2c9f@gregkh>
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>

On Wed, Aug 09, 2023 at 08:04:39PM +0200, Bartosz Golaszewski wrote:
> Hi!
> 
> I submitted this proposal on time using the website but forgot about
> sending it here too. Hope that's alright. The abstract follows.
> 
> Bartosz Golaszewski
> 
> --
> 
> Recently there have been several talks about issues with object
> ownership in device drivers, use-after-free bugs and problems with
> handling hot unplug events in certain subsystems.
> 
> First Laurent Pinchart revisited an older discussion about the harmful
> side-effects of devres helpers during LPC 2022[1]. I then went down
> that rabbit hole only to discover a whole suite of issues, not really
> linked to devres in any way but rather mostly caused by the way
> subsystems and drivers mix reference counted resources with regular
> ones[2]. This year Wolfram Sang continued the research and presented
> even more vulnerable subsystems as well as some potential remedies
> during his talk at the EOSS 2023 in Prague[3].
> 
> I have since experimented with several approaches and would like to
> present some updates on this subject. During this talk I plan to jump
> straight into presenting concrete ideas and timelines for improving
> the driver model and introducing some unification in the way
> subsystems handle driver data. While this is a significant effort
> spanning multiple device subsystems that will need to be carried out
> in many phases over what will most likely be years, without addressing
> the problems, we'll be left with many parts of the kernel not being
> able to correctly handle simple driver unbinds.

I'm all for this, we need some major work in this area.

thanks,

greg k-h

