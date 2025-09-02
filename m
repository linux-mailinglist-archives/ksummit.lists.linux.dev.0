Return-Path: <ksummit+bounces-2276-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD3B408B4
	for <lists@lfdr.de>; Tue,  2 Sep 2025 17:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBDDB4E41DE
	for <lists@lfdr.de>; Tue,  2 Sep 2025 15:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516A12E06E6;
	Tue,  2 Sep 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XPPoz8+H"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F011B21BF
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826152; cv=none; b=CkMCP4H95PQRAMvG5NcPjyqhKX0c3Ku0txYNGu4khooBhB3n0933WBVRHH/FogtPk0nUOYqthoi22Cj1VSKfJ9G3957PdWyrkdwlSsYBMrn1kPYLxx3HHN/RcM90i4TDhRBAJlztDocQVnV5EBB9Q67Q5aYAHyGXVfosKii7hdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826152; c=relaxed/simple;
	bh=qoGtyu5m4QCOHcaH1GIUeRoNbpvl++oxlKMI3DKIE3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e9FUBWiV9bfxYH3JX1jqa8C73iGMJuxrODqCW2jugWs6v3dsZWqH8vITonKPuVyPx3FgzDEPJVkFTOFR9a+6vvRTUuNMpPmRWjJtywvmYBXaEcOSYE5VvSAdXr0DCY3G3aGX9+VYwLVzgJ+GsE8qX7CrJ0ba4NidMCm2eTv8PUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XPPoz8+H; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 62A6F40AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756826150; bh=bcZKRrrYe/3aLeyEZGEvcoWbhFxph4Rl9XPebC0N214=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XPPoz8+Hw/OqZHGPTCCHjWKJZDXy0xM71RFhi17zKM+PBZ4IoTDkqvJzfFVqPZf4N
	 Q7PIXjrMz0G8I0VdWbn5KU94Cqdgr896Kg29q0cu7Ivp6+XCMGmbxU7ZloeBBPQbMA
	 NrXS3BIH77sAvbvXemk3m7AEsZ0BgD5sDIVysTz2WsFhfmXN0CpAeUehYgQsmZzvRf
	 Oys6haTTVx39EIcmAQWbvTB4o+cxfn6es2+dKP1ZSeg4/vOiZ8VQEwIwDz+FXTuMMX
	 pI3juG1pZC060z6ho6keyDiURMR+MQf4Az/CQOj9bAheZqsGyOXtk5g1UOlWgNKkSR
	 H3HhAXp5mhy9g==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 62A6F40AFD;
	Tue,  2 Sep 2025 15:15:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mark Brown
 <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
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
Date: Tue, 02 Sep 2025 09:15:49 -0600
Message-ID: <87ecsox4uy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> To sum-up those discussions, I can propose a patchset for the next
> merge window that would:
>
> 1. change kernel-doc exec to re-run using the latest available python
>    version if version < 3.11, on a similar same way to what
>    scripts-pre-install and scripts-build-wrapper does(*);

I have to confess that I still feel some discomfort with this sort of
"pick a better version" magic.  Should we really be overriding the
search path that the user has set up?

Thanks,

jon

