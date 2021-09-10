Return-Path: <ksummit+bounces-501-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37F407409
	for <lists@lfdr.de>; Sat, 11 Sep 2021 01:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7D91D3E106E
	for <lists@lfdr.de>; Fri, 10 Sep 2021 23:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E6A2FB6;
	Fri, 10 Sep 2021 23:45:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA03FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 23:45:22 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 4E0C63200A43;
	Fri, 10 Sep 2021 19:45:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 10 Sep 2021 19:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=J+I
	cl7uB3GZOQDqpLiH4V9OeHg5D3Ov7eNDVj6syhIs=; b=GMVtFKzndhfEVyvjroB
	JRebYXOQDROao5paNUE9w3Gujt+/DyCPzjcNc6AWzRTBUCVeMOQtwJ6iD1DCPsvW
	4m0Pw7xnfUyOxEXgFIMhwTqRmR1txkkF9AzvmH/4aCaf7YXRF4lO7+bKKyRqHION
	hwYdVsXSDNOcVW08elOFnGMw81dWhNkUJMEfYdhEKQw093s/y1JJZf1Mhp6+XF5Q
	3BqM3tCqr92oddr3VKS3tnpiVLD4I9S3YC1+ObAtf+ejx3EjsruO1HV9t+2VwiBA
	HcqzLXK7RBYTVBquglxXfEvzyEUZr+wDvBOCSkMKb/QJjCPxMCnneulUqf+yIhYN
	SIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=J+Icl7
	uB3GZOQDqpLiH4V9OeHg5D3Ov7eNDVj6syhIs=; b=SFInLdWaBh0KOCi6Gjsx4c
	NuBitQRCpFgwvm98a5cqxSvkEHIQU5Noxbj9e9n78bTCFwO6dd0PVF5FiUbZMQdr
	9QJ4882Gkt7A5kp9IWK9Q9D9xaYz97vi145iXiv2bWzCbljIuJxjjP1pj00yBpSr
	1Q2vBGGLKVFM5TVBMqx3CLunXZo1f8irkcfwTVQPlD2UzDG3zvsWnIMCo4TlioCF
	Grl/tdlpQDLeUMCqgsL8ebvcwCsSVy+U7NR+/AKJaJu+fbiVtJWjkUBdWSlVsR5P
	sEzKfT/en8Pk3+RFqdvAel1FGypss+9fgswrCWjTRqKEF2l0fnK1qrwTccU7jCxA
	==
X-ME-Sender: <xms:EO47YXFXLC68_qi63DqrUWVZsohVNMFSKYtJAinyU_xN8GMmAYfWHA>
    <xme:EO47YUXdkmHl-5np5giEzIibCX0C04tlJXpiBUPWs7gjaIK_TW4l6RKw5t6zSPaJJ
    pUY4h0_ov5BZsjjR9c>
X-ME-Received: <xmr:EO47YZKMUEdGzcB0wXmsJOkJItx_jDIMz8dX7Dy--jgbRioIUAG9OSqmCqiCzMJDG_f2Oq2w6w0gN_edXSXJrEh6QL2Diw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegvddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhshhcu
    vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgedtgfefgefhveeglefgfeeigeduueehkeektdeuueetgfehffev
    geeuieetheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgh
X-ME-Proxy: <xmx:EO47YVFyEjMSkaAdyKeTDCKBI9SGz-lg2uJwPfZHvRC_Fnq3ITIchg>
    <xmx:EO47YdU2fy6hGDmPy5j558cUraSMx_RrOFfsRM5sCAM46B0Jzunu1w>
    <xmx:EO47YQNTsNrdsGX824ZFkOkGiEso6Xnb42XClLrm0CBdjLoUeia8OA>
    <xmx:EO47YccWbfohQi8j5KCO6T3GaJWDiGUhT9hu_B4Uy2hPG55tsIFOEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 19:45:19 -0400 (EDT)
Date: Fri, 10 Sep 2021 16:45:18 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTvuDsrUNhg/VXD0@localhost>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911005214.71b55ac6@coco.lan>

On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> On media, enforcing userspace to always be open source would
> have been very bad, as it would prevent several videoconferencing 
> software to exist on Linux.

I don't think we should enforce that all userspace users of an interface
be Open Source. I do think we should enforce that *some* userspace user
of an interface be Open Source before we add the interface.

