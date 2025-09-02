Return-Path: <ksummit+bounces-2279-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E997B40D71
	for <lists@lfdr.de>; Tue,  2 Sep 2025 20:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF5543A6A8D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 18:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818821DDA0E;
	Tue,  2 Sep 2025 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YjnDcCrA"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE618027
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839535; cv=none; b=LE+/96qqb2Yu3vYk8rUoIwZuu6qNBGJmwH5y0qUZEL8QrUrRzIoFuCh7LvlKLP6S+bCjCJN+3fT/LTj3ObQe/dQJDDiGguLSyhdrYJuNWXBaoM2+nkwWVd/P/5yws9nJp4v8LXhroZKhm8+xM5/VcULUjju2oYCLlI86W4OEqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839535; c=relaxed/simple;
	bh=7hufbazUEShp+sr/35xI2hvZtwDgLhTiGKXpI8oqyNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nw29aTrVylv/7PVTqwTGO3Q7J4FT+V+B33egiY6wtSk0zmH2E4b4lCP891DmQSeu56ALQKnzlW/fbrq0fSeamSQcJLnofGwMXsFeyd7PA8HfoeeNBI2Wavxdvirq9919L/PW6EnP1l7O4HL+0kaIHzH9pXWbKCMd96DK5Bqq544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YjnDcCrA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9EF7940ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756839532; bh=BLr7Yv8PCfPMkqv90b5wde7+0cEKie+NwXnyv2H/NI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YjnDcCrAmqN1L2BjxyPScnh0jFwBVOkDgslRr0+mU+dGNv3Vhtw7GrZfMvn8DPlUs
	 sUyssj6xByyIEGQapC38eFxaqy5Bhsp21MWtuurCiElc9e2DmCaHhw+Vh6/YVXIVNU
	 0A1qC8GS7xPi6vVPuZ1dUOXivkKD/381JfCtzQ4QqqOPwwBALI4M++CRr2cw07VJAm
	 VIbQYwWgGlCj0T2KItJEx/KXcKjs3AAwEayQU5Qt1cTKz9S7J0kabHSmpk/LtWGXzI
	 JMNhtzvBeZ4mdPYOCyTj5W4cEIQgT+Gzk5X43JDyxO4cuhlIamdui6rtkD9lijKnYn
	 QJlnyt89PT2Ow==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9EF7940ADA;
	Tue,  2 Sep 2025 18:58:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250902191929.504977bf@foz.lan>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan> <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
Date: Tue, 02 Sep 2025 12:58:51 -0600
Message-ID: <87frd4vfys.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Tue, 02 Sep 2025 09:15:49 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>> 
>> > To sum-up those discussions, I can propose a patchset for the next
>> > merge window that would:
>> >
>> > 1. change kernel-doc exec to re-run using the latest available python
>> >    version if version < 3.11, on a similar same way to what
>> >    scripts-pre-install and scripts-build-wrapper does(*);  
>> 
>> I have to confess that I still feel some discomfort with this sort of
>> "pick a better version" magic.  Should we really be overriding the
>> search path that the user has set up?
>
> The idea is not to override the search path: instead, to use it to
> check if the user installed other /usr/bin/python3.* files (or on
> some other part of PATH). Most distributions nowadays come with 
> multiple python versions. I can't see a downside (*) of not using 
> a newer version that the user had installed on his system and
> has it on PATH.

But overriding the path is exactly what this would be doing.  It doesn't
seem right to say "we know better than you do" and circumvent the
configured path; the user may well have reasons for setting things up
the way they did.  Do you know of any other tool that behaves this way?

If we're really going to do it, I'd feel better if it had to be enabled
with a --fastest-python flag or some such.

> For make htmldocs, if version is < 3.7 (or maybe 3.6), this is
> mandatory: creating docs without that will fail. So, this is
> actually a fallback measure in an attempt to save the day.

Honestly, I'm not entirely convinced even here.  It really feels like
the kind of magic that may bite us one of these days.

> This is specially important for OpenSuse Leap, were we recommend
> python311-sphinx package, which obviously require python 3.11
> to run. The same applies for RHEL8-based distros and likely
> old RHEL9 ones.

...in which case, it seems to me we need to recommend that the path be
configured appropriately as well.

jon

