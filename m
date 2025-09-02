Return-Path: <ksummit+bounces-2278-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B3B40D5D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 20:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3E11B23730
	for <lists@lfdr.de>; Tue,  2 Sep 2025 18:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CC22E424F;
	Tue,  2 Sep 2025 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mFNy7ddl"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C4285C82
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839167; cv=none; b=WhLMN0FDZ/naQ2ZsjaKEMjglElFK5G6lxV045npojPKVrnHRHh3eKiLUZUrp9H2aHkoVSyjZ7BEA56pqXKlWYUZPnLVXQ1G+T2duOKtJTtCi7WfrZeqSvnC7ug2nWnmmwscVG9HmVCeoP+9G06d+Ot5cHruhTfg+YUWXv+hC3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839167; c=relaxed/simple;
	bh=kdqUrKt+psCC6dEdtciQ+Cax5qFXspjKVZGEWm+BqIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYhh3mfZGPB43+A7nk4uglu5sgE5Izy8Iek5nssQb5NqW33VqboeDqLs+qYO88mzxJbslIoXo9OpSMuo2Y8JppJZxIxmxz+J7NKq5BW6f7mGeE5bQabD4KK1vujpNu6bwhLY/hrxE0q/NSAOupuopSRNYvmCJLiAJkCZBud7zRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mFNy7ddl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 26B66C71;
	Tue,  2 Sep 2025 20:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756839094;
	bh=kdqUrKt+psCC6dEdtciQ+Cax5qFXspjKVZGEWm+BqIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFNy7ddldoSrB4NzuXvbCwen5hFsjjZePoRP62I2DBQ0hX8iN5rCPYhg+W8rLpAbo
	 5AHF/gDytjZkj2WVrpsL5X7Y5c84XhBRblNAOAPAtd+FWg/wrFHXcnDKdOvXRYGwQs
	 02Q6B1J/egIxL7MrvrELHhAT6ydyL9TkKtBfNiRc=
Date: Tue, 2 Sep 2025 20:52:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <20250902185221.GA1602@pendragon.ideasonboard.com>
References: <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan>
 <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902191929.504977bf@foz.lan>

On Tue, Sep 02, 2025 at 07:19:29PM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 02 Sep 2025 09:15:49 -0600 Jonathan Corbet escreveu:
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > 
> > > To sum-up those discussions, I can propose a patchset for the next
> > > merge window that would:
> > >
> > > 1. change kernel-doc exec to re-run using the latest available python
> > >    version if version < 3.11, on a similar same way to what
> > >    scripts-pre-install and scripts-build-wrapper does(*);  
> > 
> > I have to confess that I still feel some discomfort with this sort of
> > "pick a better version" magic.  Should we really be overriding the
> > search path that the user has set up?
> 
> The idea is not to override the search path: instead, to use it to
> check if the user installed other /usr/bin/python3.* files (or on
> some other part of PATH). Most distributions nowadays come with 
> multiple python versions. I can't see a downside (*) of not using 
> a newer version that the user had installed on his system and
> has it on PATH.

I'm with Jon here, I wouldn't blindly override the Python interpreter
selected by the user. What we could however do is print a message if we
detect a version of Python that could improve performance, telling the
user they could switch.

> For make htmldocs, if version is < 3.7 (or maybe 3.6), this is
> mandatory: creating docs without that will fail. So, this is
> actually a fallback measure in an attempt to save the day.
> This is specially important for OpenSuse Leap, were we recommend
> python311-sphinx package, which obviously require python 3.11
> to run. The same applies for RHEL8-based distros and likely
> old RHEL9 ones.
> 
> Now, for kernel-doc command line, checking against 3.11 is arguable,
> as it runs slow, but works just fine with 3.7 to 3.10. 
> 
> Yet, trying to re-run costs about nothing, and make kernel-doc to
> run 55% to 60% faster. IMO, it is worth. We can first check for
> a PYTHON env to see if are there any overrides.
> 
> (*) The only possible issue is if the user installed python 3.11, but
>     forgot to install python3.11-libs package, but it sounds easy enough
>     to check if this is the case via a try/except logic.

-- 
Regards,

Laurent Pinchart

