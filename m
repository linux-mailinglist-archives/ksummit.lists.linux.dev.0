Return-Path: <ksummit+bounces-631-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E828415C8B
	for <lists@lfdr.de>; Thu, 23 Sep 2021 13:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D65263E0E75
	for <lists@lfdr.de>; Thu, 23 Sep 2021 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8073FCF;
	Thu, 23 Sep 2021 11:09:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0006E3FC7
	for <ksummit@lists.linux.dev>; Thu, 23 Sep 2021 11:09:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 319975C0139;
	Thu, 23 Sep 2021 07:09:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 23 Sep 2021 07:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=/hOwP9XKbPzjW6cQ+cj2UG1X3ic
	R+CDzrCXfBg9OKKw=; b=RiFt+ibZhZMN/Z1F8OzL7XLEHG4VFi4y2rRPZHdRuoB
	L8tyjgJeMPyf0ONSVzzEhOAtljC+eDj7BPy/gchW0ZSD13rBhc80KuqoZ41uaFBc
	uuccAt3fJHLJExODfk6KPSZb9OX1JlbRQxIiaccmCMiPbPtLw8nw5bf59fk7koG2
	g8oBp3u4rd14yhuzAGDKEZhp18/B5+GF8k0v8tFZm9PRNaZ48tFx2CDp1rgVO93J
	X96NyaCyM50FA15hhWuQOfL7l4EzFb02jmbJQQG1zhzbFE2W/IJD83HtjdFSH1gW
	ijm9F9eFxugjD6Hn96A6k5JzbO+G58KDLhQ9P7rh5hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/hOwP9
	XKbPzjW6cQ+cj2UG1X3icR+CDzrCXfBg9OKKw=; b=RZTd18I56RP/7Tj6nVzYJg
	MNnjd7QfzpashA+wbp4Nw0Xy8FNkfKm1FNwVKDUCd01YBck6vlPOiwDnVCvs80hO
	w/+Tah2XWLOk3OAw42JvVfwyS9y//56NtmMILrLuJNdt46WT5erQWFWZm7tgHciy
	0S0xbr1MtCtrp+9rR0BoSqY2OJxdkNu1hXWjTb3tPLW+DsuoqRpttiPKEN1pec1v
	kPj1lsK8pQybjCKtu5hRct1Rkz5GD49YCDxwEoSrM6F/EIHxplX3IxNMOcHHj6bA
	gJ2aS3HV6y9HUvgvaCDGKrPcmEg6vs9ysmcSxPrn+Z1E9Yn42e6PytzApu+bl9+A
	==
X-ME-Sender: <xms:bmBMYV_F2ilwy9CsDQnHFFqB56MotBtLnOwhDB1V_U9wCuVw_xWuyQ>
    <xme:bmBMYZt_A_1PhFXa-w24jChgVl9v9-92lW1qNZzn3MsG6AAXR_-6fSmGqLPY2gecw
    6uukW0VgWRx3w>
X-ME-Received: <xmr:bmBMYTDvZuM1ep5IDGB2wz4CLwlnPeI-cnko5H8LdDGF4sWgYl7wr33OYfZSEQRNB7jVTkWb7WEMOuTqb6Dak5ISVxhc_tO2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:bmBMYZdj3LIl5uBCr1rxiH1ANDacSc17FFDJ8DBFCv2IFmXE76KpNg>
    <xmx:bmBMYaPVxybjVWO1qcojJTn4ekWEmtmmtzqP7SXTvWtPnu7KSYjGog>
    <xmx:bmBMYbkEMdq2zxV0PMSFhXEkksvsljXK6jvmyrGFmavh0aMVm33piA>
    <xmx:bmBMYXo3jdOVJIyj-jYqF3E6wHLjE0AkeGzsB2HjINp5ClL_LQ6CbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 07:09:33 -0400 (EDT)
Date: Thu, 23 Sep 2021 13:09:31 +0200
From: Greg KH <greg@kroah.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Theodore Ts'o <tytso@mit.edu>, ksummit@lists.linux.dev
Subject: Re: Potential topics for the 2021 Maintainer's Summit
Message-ID: <YUxga4g1puy68oVv@kroah.com>
References: <YUwOE5ExtvMye2t/@mit.edu>
 <YUxNpVkO68dllK/N@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUxNpVkO68dllK/N@pendragon.ideasonboard.com>

On Thu, Sep 23, 2021 at 12:49:25PM +0300, Laurent Pinchart wrote:
> Hi Ted,
> 
> On Thu, Sep 23, 2021 at 01:18:11AM -0400, Theodore Ts'o wrote:
> > 
> > After discussions amongst the program committee, and looking at some
> > of the discussions to date at the LPC and the Kernel Summit, we've
> > come up with the following potential topics for the Maintainer's
> > Summit.
> > 
> > This is not the final agenda.  We are soliciting suggestions and
> > comments about these topics.  Is there anything we are missing?  Is
> > there something you think wouldn't be productive for us to discuss?
> > 
> > 
> > 		  Potential Maintainer Summit topics
> > 
> > * Reviewing how we reacted to the University of Minnesota issue
> >     After Greg K-H gives a non-technical summary of what
> >     happened, and we would have a discussion about what should be
> >     done differently next time.
> > 
> > * User-space requirementrs for accelerator drivers
> >     There was some good discussion on the ksummit list, but there still isn't
> >     a clear consensus of what the policy should be.  From Jon's message
> >     kicking off that thread:
> > 
> >     - Under which circumstances should the kernel community require the
> >       existence of freely licensed user-space code that exercises all
> >       functionalities of a proposed kernel driver or feature?
> > 
> >     - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
> >       are only available to drivers with a free user-space implementation?
> >       Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > 
> >     - What constitutes an acceptable user-space implementation in cases
> >       where these restrictions apply?
> 
> Just a quick comment on this. if it can be useful information, I'd be
> happy to briefly explain and answer questions about the ongoing effort
> to build a camera stack for Linux. We're running into the exact same
> issues, and have been trying to build bridges with SoC vendors over the
> past few years (with various levels of success).

I think there's two different main topics here:
	- where to move the existing accelerator drivers to in the tree
	  and who should maintain them
	- requirements for accepting kernel code that has new
	  user/kernel apis

The first topic doesn't really pertain to v4l and libcamera, but the
second topic would :)

thanks,

greg k-h

