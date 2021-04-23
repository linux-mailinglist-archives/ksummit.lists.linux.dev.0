Return-Path: <ksummit+bounces-133-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C9368D02
	for <lists@lfdr.de>; Fri, 23 Apr 2021 08:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id EC99E1C746B
	for <lists@lfdr.de>; Fri, 23 Apr 2021 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3A42FA3;
	Fri, 23 Apr 2021 06:16:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB12F83
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 06:16:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 9E837161F;
	Fri, 23 Apr 2021 02:16:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 23 Apr 2021 02:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=p8ffhKIxmEkpSnDgHOa3giAINWk
	QGT5aWRZ5bF8+wIE=; b=U2XiNZoy1YirjJvLt4IuOI9DhhrdxDc8LTL3x3eNDQR
	TR8icV4dThNEcclSE5RDqeprVrdzzCuAiWcE6tdKFMjIdzvEdoNdsq4d7aArF2re
	7FSdqPjbnqy8bdHzcXIxzt2jW4wbsrXMShvQ7R7n/yhaSv1ucX4qC7k/FsPRlRKQ
	aLPYmULfow1qwmJxcaCSUItSpRbiExjhTFnCTVC+xTx7FSLpebHneyDBddokjVUC
	irMJ/ye3nwHmdliSQDhXZaW0avVqDOjPPN2nqbB8QtCjaAFTCJikxzt2wXwtZaoH
	/pVCTJrTUuFfmgAEBSjxlUBV6Pj/17GuEABMffa9fKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=p8ffhK
	IxmEkpSnDgHOa3giAINWkQGT5aWRZ5bF8+wIE=; b=FcEzsioe2ym5VF3YZunmwi
	dQw03xyoaEMOvwTqHbAaYt8t5Su7aeRBql+qm+9aGDCLJEu0SeiuX6nyoMSHPAcP
	IlAzGvCLLmEINjn/58Pw/TAkjxfIjfDeuFl8NKcYhq7yELmpxWAVpXzXnZQ75mmS
	QBSfPLCA9Dzr73ffWnEGWaF84hozNBnX+1n6MgtaIJybnIkKZwEDQqXhRrGJORAF
	xuvSgQlnzS2JFZjcHSCjWauzkZAi7I9luwAAw2mUPMYA8CXR3eftcoXrmXT+hfWt
	RikwsOyumcZu2NyHnxG2ZjL8ibVYNq5iRlYD7yxScdFnAn6lAGK1q7Uqx9SqkPsg
	==
X-ME-Sender: <xms:OGaCYJvowqoX3lD8u-iod__D6ldgIB6dg5-db4aTGiXtopTYkOGwYA>
    <xme:OGaCYCdo0vKiDdbkmA_WTJbPlNSI5001wB4SpqyOzTb_dg7FJCsEeoc4tUMw20SZY
    d2ryRi-jLVSUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:OGaCYMy6fTr7jkYWjKOKUjl8N81t-KN-Ow4rCitNYZJNjW33cdZNQg>
    <xmx:OGaCYAM9Tz4lTz6Hpwrqjw5KcbF7HhGZ3QBCFmxmqbscv7LsGI3UWQ>
    <xmx:OGaCYJ9wlc1bUGp-BbpFFF3h5f6-M4WNuiwj2z_7tAeCN6XOzzb78g>
    <xmx:OWaCYEYr0rWH9xPcuEUN9ocR5S0LyLQuwbcEFm804PpJb3e0PWjHpw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 73D6F240066;
	Fri, 23 Apr 2021 02:16:23 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:15:34 +0200
From: Greg KH <greg@kroah.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIJmBvtU74D+N2DL@kroah.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <20210422132339.GF4572@sirena.org.uk>
 <20210422111939.0c555039@gandalf.local.home>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422111939.0c555039@gandalf.local.home>

On Thu, Apr 22, 2021 at 11:19:39AM -0400, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 14:23:39 +0100
> Mark Brown <broonie@kernel.org> wrote:
> 
> > > For me the most annoying is to get several patches from the middle of a
> > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > so that people at least can take a look at high level details and request a
> > > repost.  
> > 
> > Yes, the cover letter should always go to everyone.
> 
> And that's still the one thing that quilt send-mail does not support :-p

'git format-patch --cover-letter' also does not seem to support this, so
what tool does?

thanks,

greg k-h

