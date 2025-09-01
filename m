Return-Path: <ksummit+bounces-2260-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088FB3EEFE
	for <lists@lfdr.de>; Mon,  1 Sep 2025 21:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811034E1B2B
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC11221FBF;
	Mon,  1 Sep 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="grDFTlE+"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAA1DC9B1
	for <ksummit@lists.linux.dev>; Mon,  1 Sep 2025 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756319; cv=none; b=JM+tPs4PV7VN+/boH/00r3nqSLTcNwAQTLsUlYlkpSCiMYEeDzQl0S0nn/Hjpw78Kgbwwy+8JBkAhqSyj2DJ0CczJv7GmmOBHhGqMM5swAT47XV7SWP+Pa/epnUGZhoP/HauOlUnYac/RFxhUCQ8wNyehL2TnV8QfxCuamNqjLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756319; c=relaxed/simple;
	bh=4iRYmzvqrwZE5Atj6cj0A2VXWDTU24w+stjnHfmtO+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kh7viOrAIwE3icB3gKqr+bRihrkyPgL9HRSLTRUeXCcS4Vmk/SM7iAymXpQFMl9WrOFXUSF6l2UxNUv7D+DKHHX+nYfPP07TZkuNS+JbsLy5RDfxA0T78GYRaaB2yk2jUuF7F066HZl+FjY3A74uqIUUO6kSz2Ib1POXcsLuPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=grDFTlE+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47D1740AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756756316; bh=arVsE4h69hTi+f1tA/3SNP/Def6zuK4ELAa02F+0msw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=grDFTlE+kdlSSyIhDZTqzx7VPiPq6HQLxmpeu9FCA0LFWZy75hBHiUuHO3dGoLgTj
	 s9XrLZi7eywHH4RQG3UCupk5fSiINqaYd6COKDxMKIDYmjiuQLVoi2gO0AWVUaGQZj
	 3jZQOf8pDGzo8aQgKfEJIBT12Xkgi2XYtTdKb+SbFU0hYwz9XBOte61o+4IYkDXvg7
	 9B0ysOl368Kl/RBc0BPY4ZKsWH+eDg7J3Qsmo7udiYuNLKj+aFzuynm6qfnmB6QfRR
	 Xy2qaaQ2i6qXbLYEZXbuOv4VPxonXz6VLy8l/zKkdEgp2tL4aDV8E82+IuUXmz65KT
	 0eYX0A3+9Ej+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47D1740AE3;
	Mon,  1 Sep 2025 19:51:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <7f507a0e-3493-4b9f-a6b9-912efe49e5ba@sirena.org.uk>
References: <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <873496yqqt.fsf@trenco.lwn.net>
 <7f507a0e-3493-4b9f-a6b9-912efe49e5ba@sirena.org.uk>
Date: Mon, 01 Sep 2025 13:51:55 -0600
Message-ID: <87tt1mx86c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> On Mon, Sep 01, 2025 at 12:25:30PM -0600, Jonathan Corbet wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> >   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total
>
>> That ... is weird... it takes me a little under 3 minutes to do an
>> htmldocs build, using a capable but not stellar desktop machine.
>
>> Which version of Sphinx are you using?  If you're not on Sphinx 8, you
>> really want to be; they finally fixed some really nasty performance
>> problems with that release.
>
> I appear to be on version 5.3 which is what's in my distro.  I will get
> 8.1.3 when I upgrade, I don't really have any intention of manually
> installing an unpackaged copy.

That version will be far slower, certainly.

Just FWIW, installing a newer version in a venv is trivially easy to do.

jon

