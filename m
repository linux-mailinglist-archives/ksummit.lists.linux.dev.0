Return-Path: <ksummit+bounces-2272-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B43B4004A
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B81B4E8333
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06802FB973;
	Tue,  2 Sep 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGYNjZk4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D32F99A9;
	Tue,  2 Sep 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815280; cv=none; b=AIfeoVwExRan6hSE6DnEwZfp3AwTk48kTZ4i8YquWBaS81Lnc1urbNeBdwrFxgbfEB8PfabhEZO5D0NoMbZ0Y7NVxWNQRSNYmswad8xfhFp/KqNJ74QjvhM5k4SPB1Omcl+PIYOjuUogrog2pgPwfYsN97szsyLE4NjTXn+WRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815280; c=relaxed/simple;
	bh=J774KMq/2KLIiPl+2yl8M1+EbkCJ9j9GweBl0XtOCCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxX9eK9xqQi8f9KXgBtLSQKtVP3e4rD7XYyfgldh7B2UcDUBSyLwXnuQT15msYswHLdvTcYF8Lb9/DrHJB0hbX+YITuosjeYSc1KZtvaOzdRUV+ppCDkBII11GSjn/wICU7OcJrfg93pG7yr9e7LVcgjCiySOodR7tdLjRX64bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGYNjZk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F02C4CEED;
	Tue,  2 Sep 2025 12:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756815280;
	bh=J774KMq/2KLIiPl+2yl8M1+EbkCJ9j9GweBl0XtOCCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kGYNjZk4N5v8YY+XpF3yPNZH6ktdsqc9tIZnnSrkOTdpDL7EMzy5FGPY7RbQ02zwV
	 LxHO6+NjlWwftZZydYDcWSdR9zax48HTXk/QgeYK0NtGzCJoj1A0pozogJXFrnFrER
	 0SC75hDoXtsGqmKXwR7s9LzEEUe3xwG4KhnhRArZkNSW787wXNjtarEKY13qJj05M9
	 vFlj6/sVdL7Rw4+TT0pR2q4CBqdm2v9XRj2+02vORN75DCQRrhgiBsGcRFV6jOJQFE
	 jNzYAlGqP/8mQCZKr2OJwUw5sXlssPVhfgSlbfOPMaqmyWWznprkkRh+waOXts/8/q
	 x3KkxLSVtyIIQ==
Date: Tue, 2 Sep 2025 14:14:34 +0200
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
Message-ID: <20250902141434.3e5b14e4@foz.lan>
In-Reply-To: <20250902135938.35048fbc@foz.lan>
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
	<20250902135938.35048fbc@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 2 Sep 2025 13:59:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 2 Sep 2025 12:15:51 +0100
> Mark Brown <broonie@kernel.org> escreveu:
> 
> > On Tue, Sep 02, 2025 at 12:56:57AM +0200, Mauro Carvalho Chehab wrote:
> >   
> > > If you run:    
> >   
> > > 	 kernel-doc . --none -Wall    
> >   
> > > You won't have troubles with Sphinx slowness. It would be worth timing
> > > it on you machine and see how much time it takes to run. Probably
> > > the run time depends a little bit on the Python version. Not sure how
> > > much optimization it got(*).    
> > 
> > That takes about 90s for me.  
> 
> 
> I wander why here is 3 times faster... disk cache? python version?
> faster ssd?
> 
> What python version are you using?

Heh, after running twice or three times to avoid cache issues, I tested
running it on my machine with two different python versions:

$ time python3.13 scripts/kernel-doc.py . --none

real    0m31,660s
user    0m30,911s
sys     0m0,588s

$ time python3.9 scripts/kernel-doc.py . --none

real    0m59,004s
user    0m58,014s
sys     0m0,730s

$ time python3.6 scripts/kernel-doc.py . --none

real    1m16,494s
user    1m15,400s
sys     0m0,765s

(after a fix I'm about to send to prevent lots of output about
 python version)

So, yeah, Python version seems to be one of the reasons why it is
taking so long on your machine.

Thanks,
Mauro

