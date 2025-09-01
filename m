Return-Path: <ksummit+bounces-2251-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F71B3EDCB
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC0167A7476
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584232F745;
	Mon,  1 Sep 2025 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lxNYlVPZ"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E321A457
	for <ksummit@lists.linux.dev>; Mon,  1 Sep 2025 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751133; cv=none; b=ad1seLr/R2tLWvExa01KWbiAD6RXw2CSWlCi/AAbdojAJ0Uo77gCVSWs2bYXBn2mB/Jl1q3ff1wqIILx3zBP9YDHYdcrepX+TCeVpyyyXR5LiivnAvCeNqhhsiV1ZZp0K0VLe08C5kl14zlIqFv9b1PqTbC2itwIR46SiRb4TlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751133; c=relaxed/simple;
	bh=3W4hGGTbEruFj1LfrqV/Q3pJt2FAoeBiajeEGf4p59Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=My9hgFwpG60dlKpDCr7ssa6kg9N4vsPsQTXkXqsBIFgVv1CeR5OZKCOr/4AYehWxlALcI9E+sxy4TY8/98DMCHjhBcwIss2i/l7rGFXStqxJItxMQgx/nOI+9DJY8TTbCC0ISCJKAGFOCuBKIvnsGRuaU35Im7p9WDbiT0/Jz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lxNYlVPZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9130540ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756751131; bh=oaGPk6dTWyRn6vlhNTZeRj7Z6qA87D1jM7B2dCgEYkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lxNYlVPZrmrVJMmfvQVlv8iKk5BwdxdK3loKrXvtbP2yFRHv3RzznzCoh5VcRkfOl
	 wMNliNW8swkpsYsJmBFjR79Cs07n7L/vmWNvN3icBU8E5C7VmjxIOCHHLNpB/a9k//
	 ra32jYQvzydR7WhRvoBWxjFx2XM49H430RwEn8dGFqqQO6C5vUqelUp7iKy+BPbko2
	 l2bU2SEYw8JDL9iJd60ZKP52+vZsBaMoDp5ATD5rOkc0eK58M/clci1NIQma6p9VRL
	 qeB26tqoN3cSgfeNp2PMbvFH7ridB/DaUozQRDli9hYqMNjcGCIzUJetoEOOrU/ulJ
	 ua0ReYBmtBrjg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9130540ADA;
	Mon,  1 Sep 2025 18:25:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
Date: Mon, 01 Sep 2025 12:25:30 -0600
Message-ID: <873496yqqt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> On Mon, Sep 01, 2025 at 09:51:01AM -0700, Randy Dunlap wrote:
>
>> Willy had a suggestion that we just make checking kernel-doc during
>> all .c builds a permanent feature instead of a W=1 option.
>> This helps, but still doesn't force 'make htmldocs' to be run.
>
> make htmldocs is rather slow:
>
>   $ time make -j56 htmldocs
>   ...
>   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total

That ... is weird... it takes me a little under 3 minutes to do an
htmldocs build, using a capable but not stellar desktop machine.

Which version of Sphinx are you using?  If you're not on Sphinx 8, you
really want to be; they finally fixed some really nasty performance
problems with that release.

Thanks,

jon

