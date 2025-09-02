Return-Path: <ksummit+bounces-2277-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C8B40BD9
	for <lists@lfdr.de>; Tue,  2 Sep 2025 19:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 410D6540A4D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 17:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66988340DBD;
	Tue,  2 Sep 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwKOtULW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1C4C9D;
	Tue,  2 Sep 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833575; cv=none; b=SYU8flBqBC9qolR27LuDuEl/8DnD2iFnhXzluBDvsxv+RINhbMoyZpyOGE08U3rJi2Sbpn+35oqzwKyXymKgL+boJirGUHjULMI8zAPAdwg45F6v8lO+1n8c2SOEN7gh65p0WDII+0WR+LKHfLwaD505QkiwTW4HdRIFuckrzRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833575; c=relaxed/simple;
	bh=6TYEetp/vWL904Wa9UKszaWC33IY7f21k+7wRNlugxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rss0SvDikHklWxBlgsHogmwXcvnx0zn5ztAFSW0Q3j6/DVw+lOj63MXtq2EB1PwDFjdrB6uy06X7TIFVGrM1mfCm9tPCWq3Ex0Gp1VTonf1ZKRpxeyAVeKCka1AhCu4Z0/NQV7l5hNCiWtpToaa3nIBHk5/47C6/qcen/RBrNtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwKOtULW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403C4C4CEED;
	Tue,  2 Sep 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756833574;
	bh=6TYEetp/vWL904Wa9UKszaWC33IY7f21k+7wRNlugxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UwKOtULW2cemD9PzRZltkn/PecqoSN5zeVOPhkX5Tdzv/L1SuGyaG8OzTMcO3G0IO
	 l+Ji9a/n9E6SxwB31Mn7HsdrvE2Hvu4QWOECwpb/1NQzGWik6ThbMJSiqdgQk+spMd
	 i3VFBmSV62a2MFytdOx8/8uH03serMdsjhKOVwa1XU5YxajsaGQe3Fx8Bxr5gdkWXX
	 kbYDiSEh3vRl2S69DZqF3km+O7Lst0PL9aEjBMg/AA2S36dqoYA2JkyPhwAHPIzlzb
	 2VgP5wC831l6DMYKynzHSATzon0g+2QoTiAv9JmJJ/J4uSrpLPI9dPng+2G/YL5+Xi
	 4KiA/kFr2Kefg==
Date: Tue, 2 Sep 2025 19:19:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250902191929.504977bf@foz.lan>
In-Reply-To: <87ecsox4uy.fsf@trenco.lwn.net>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
	<20250901204635.51b81ffd@foz.lan>
	<1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
	<j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
	<865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
	<20250902135938.35048fbc@foz.lan>
	<20250902141434.3e5b14e4@foz.lan>
	<8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
	<xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
	<87ecsox4uy.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 02 Sep 2025 09:15:49 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > To sum-up those discussions, I can propose a patchset for the next
> > merge window that would:
> >
> > 1. change kernel-doc exec to re-run using the latest available python
> >    version if version < 3.11, on a similar same way to what
> >    scripts-pre-install and scripts-build-wrapper does(*);  
> 
> I have to confess that I still feel some discomfort with this sort of
> "pick a better version" magic.  Should we really be overriding the
> search path that the user has set up?

The idea is not to override the search path: instead, to use it to
check if the user installed other /usr/bin/python3.* files (or on
some other part of PATH). Most distributions nowadays come with 
multiple python versions. I can't see a downside (*) of not using 
a newer version that the user had installed on his system and
has it on PATH.

For make htmldocs, if version is < 3.7 (or maybe 3.6), this is
mandatory: creating docs without that will fail. So, this is
actually a fallback measure in an attempt to save the day.
This is specially important for OpenSuse Leap, were we recommend
python311-sphinx package, which obviously require python 3.11
to run. The same applies for RHEL8-based distros and likely
old RHEL9 ones.

Now, for kernel-doc command line, checking against 3.11 is arguable,
as it runs slow, but works just fine with 3.7 to 3.10. 

Yet, trying to re-run costs about nothing, and make kernel-doc to
run 55% to 60% faster. IMO, it is worth. We can first check for
a PYTHON env to see if are there any overrides.

(*) The only possible issue is if the user installed python 3.11, but
    forgot to install python3.11-libs package, but it sounds easy enough
    to check if this is the case via a try/except logic.

Thanks,
Mauro

