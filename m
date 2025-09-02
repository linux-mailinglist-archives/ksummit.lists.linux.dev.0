Return-Path: <ksummit+bounces-2269-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF3B3FF9C
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7995C2C22DE
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4963218DD;
	Tue,  2 Sep 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssjeh39z"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AF31E0FB;
	Tue,  2 Sep 2025 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814385; cv=none; b=cPuFv4R+KgZzfUn2LKq764rXxdZYOqZedGzfaQorFEAlln3cVLk3GddqDsFkexQyyfCono+7Fszih1qAAvmwJG52VQDB64KTjJfAxm6S2rcAaiOOCld/Ml40n8zEHiN3SGuA4QPJfK5wYGiPINpV3F9vrUL2nZ8mlxy9Hd0rVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814385; c=relaxed/simple;
	bh=Lz9IHriNHvMDumsWCGaYFFI0bxBOE06oQuGCHKxmsT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqTQ4Kf+Hqz5oWTwFQX1bfc0mDzDU/vABJkVzQMSL6LmuJyysMx1EVLb/IyD4C610xnDOl+ex529ON29I5QMGOcSJmHKN2mzESyHagAyVHWT98l2LWasCD7iBR6xVAy4Oi/IhiL5ocEsyBcfuB3JA9Ou1VCdTeZIEWUK9unrvow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssjeh39z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D18C116D0;
	Tue,  2 Sep 2025 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814384;
	bh=Lz9IHriNHvMDumsWCGaYFFI0bxBOE06oQuGCHKxmsT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ssjeh39zlvBK6nfg7f2KrHvTsyAwp2xuZQKX9BMgrtST7YIsXqYNaovIqaZRyhpjX
	 YKPkW8+CKGG06O0zXXBXtr49BZ93JFW3bTtL++TIa7eThaGAnLka//1R0z1GlsGb3+
	 fx47OrP3DnRWa8xywBk6Mj1OQaUz3EEjUUG1Ja83snEmTX5uknOqZmughiuNMb7X0X
	 AKCtvpNIVO6AJ+rsJ/WhaozgiDSng5oQByykPc4GgbuL6WXy8jtNwV3TxZR1+moQ32
	 zNe6ocMXDewZYOPIN63KsO3qT6X6ox5XsEi3gZIh4kB1/0bU1/4VR4803lxa8JhNVE
	 7XdptY3Yw0Neg==
Date: Tue, 2 Sep 2025 13:59:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250902135938.35048fbc@foz.lan>
In-Reply-To: <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
References: <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
	<20250901204635.51b81ffd@foz.lan>
	<1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
	<j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
	<865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 2 Sep 2025 12:15:51 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Tue, Sep 02, 2025 at 12:56:57AM +0200, Mauro Carvalho Chehab wrote:
> 
> > If you run:  
> 
> > 	 kernel-doc . --none -Wall  
> 
> > You won't have troubles with Sphinx slowness. It would be worth timing
> > it on you machine and see how much time it takes to run. Probably
> > the run time depends a little bit on the Python version. Not sure how
> > much optimization it got(*).  
> 
> That takes about 90s for me.


I wander why here is 3 times faster... disk cache? python version?
faster ssd?

What python version are you using?


Thanks,
Mauro

