Return-Path: <ksummit+bounces-168-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F320392FB3
	for <lists@lfdr.de>; Thu, 27 May 2021 15:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 501B61C0EC7
	for <lists@lfdr.de>; Thu, 27 May 2021 13:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19DE6D11;
	Thu, 27 May 2021 13:29:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28F6D0D
	for <ksummit@lists.linux.dev>; Thu, 27 May 2021 13:29:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 03E7658472F;
	Thu, 27 May 2021 09:29:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 27 May 2021 09:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=6GRC/0MZj+00ZlSbSG5P9vkghEm
	DAwpet/OoF+tag/w=; b=J30v3f1+Fi4bHN7Zn4dwceyEbf5fD488Th/llLcnfxg
	1rz6UKwNj3gIPfRjzPu66rZ1QtWKMCU+bJdfrxyY2fqfmHrHL8NJC8eKqc54iVRa
	quCEMoDTab5jRc91dT7ZT+pwuD+w6Z+YKM1q7WrGfaox0dgJrMl29aRL2LQKjW6z
	5aSVawgcfKcFLMFOoHe/1VcKwfBBv/Ki94XiiyHalvg91O2eqfFw87pE3BKUibOV
	53VUN3N3IPOC/dWKxsQe2PQmxMA6TrtudBhADFT4IpW7sIWRkN4fAbzCGx1//mgr
	LcIbzvcBB9O5cc5bEa2QDReidoHHQQThTLwYkLqmGFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6GRC/0
	MZj+00ZlSbSG5P9vkghEmDAwpet/OoF+tag/w=; b=LK+sfIEv8YeEF+e3vwIVGf
	Y2aK45WaeUtarPyLe7y1UH8LAPgdmtSIKR2Rxw4oJpwWLewVHna1nsTVdtil4skT
	FI0HW3TsE+HY+YF0pIYWpGlM0t/Xd4+wUVN0yK2pSgqyRjL6WkIGZdN1KR10IHTl
	SZpyCAkg+5WkQQJvhcFpAnj0JrslVbOQhwtTyBcVBZewNuZu6g+yqm5PmJtbdkoa
	iBVYi5J2gL70lNENxM+zouRkovpGmydn0YGiV/Fa2S6MP3uLoG1dS1+9uIW2Zz0h
	R+bWSZ1ewImJ5uz0Wi/ulKM9T3YrnjN/lwH7CeL7tGuvCcZnVZfRcn3QFLkbu9JA
	==
X-ME-Sender: <xms:tJ6vYJh9d7hPAKdE4nTdv8A2OU9nvV6H50bjfjx0PhCEQNliYEtUGA>
    <xme:tJ6vYOAlzcXj-yHCUs8ygoKaHBp8TxtaK_h8BCYY0HnwUqUfXG-Q2aGk-qwZfdDeI
    JfFsHrVCVJGMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:tJ6vYJG4QKrbZvbduRD91eEuShjSfEhn51iSOiLpyKIyRce8Iq5Quw>
    <xmx:tJ6vYORH8MtfBkmd705suIxefTdfwI59n9nQqle4CGuo1_6KXS1p1A>
    <xmx:tJ6vYGw4WfBGZNbtnM_lsJ_wv2oJhm3o-u7k3qlTfooie76SJAQqMA>
    <xmx:tZ6vYLGBmm35YucC4o8kg85jksAT9NRr2GsPTvGH_YzP87de6qsP3w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Thu, 27 May 2021 09:29:24 -0400 (EDT)
Date: Thu, 27 May 2021 15:29:22 +0200
From: Greg KH <greg@kroah.com>
To: Christoph Lameter <cl@gentwo.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YK+esqGjKaPb+b/Q@kroah.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>

On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter wrote:
> On Fri, 30 Apr 2021, Theodore Ts'o wrote:
> 
> > I know we're all really hungry for some in-person meetups and
> > discussions, but at least for LPC, Kernel Summit, and Maintainer's
> > Summit, we're going to have to wait for another year,
> 
> Well now that we are vaccinated: Can we still change it?
> 

Speak for yourself, remember that Europe and other parts of the world
are not as "flush" with vaccines as the US currently is :(

greg k-h

