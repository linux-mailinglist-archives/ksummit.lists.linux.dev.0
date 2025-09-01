Return-Path: <ksummit+bounces-2249-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DCB3EDAB
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFDA207EDE
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0581A239E63;
	Mon,  1 Sep 2025 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2UVIe9lK"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919516132A;
	Mon,  1 Sep 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756750554; cv=none; b=YxNi7dpDOIYQSc2OwK4bpF9yXAJ3jpLFgGWU3imUUpu5owqNrjtJuk4cyxDaJTdHVIIfU2dog/aJlhAN+Sf588Cw6bEzU2/+7jI2Prer0DnF2tIQZnLVvfyzIEcf4PsZzDgSXHVQYjFlG2FkTuf5SisZyQfR823TZoh2jV7lEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756750554; c=relaxed/simple;
	bh=7CzD+pxO5Ta5pvGZTs3pd1Ibie9wy6Tm6tKdIsV7FOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxEljI9z0ZO4QvVwiy60j1pqS29f8jJlP14dnH98VAMSVgx8Hg4K5f9UZUWvwXOgwWSz3XxxZN6YCOtNtzwiC/7Rurh4qv46oClB/z9xwczNGIeYD7L8Rdt5eRexhE4sjZVpCAn1lz6UDr7GpAp2sNkoF9Cctv1ebu0Cddc8lRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2UVIe9lK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6PLbKrTqDlV/rgrKakybTJQzxxfzQkbpPoJMusdTYLg=; b=2UVIe9lKuGKQpmU5ztP3jxZtXd
	YHoYCg4K5nNnobPLWjcner93CNWho7ooOxw25JZLVZP/sp+DZ7YdLynQiBgafBRxYMGx6xQoZ57as
	zzb96Z0TPDDyjIZbRQH4LWm4s0HhOUv//BwIhzFizFHRgbhnzJGuM+AGcxKyxZ+uKrQwSUiqgYHSu
	ifVquIiCVVWAujQgH0aK/cX3oyA0BNEM29ANW33WF97EX0FcZc9VWLIBleRKUH21hl9vGz0nsLxMr
	L+NknHBBLbOul8MghVvAiZW9ecDYmvOtLLjX7F+2j8Tk4jtvJzUEthhNU7c085bIKNnkgcHHBky9d
	tcw4nR6w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut94I-0000000DXsN-3Mlz;
	Mon, 01 Sep 2025 18:15:50 +0000
Message-ID: <6c2f40ed-7dbc-4ae8-8231-f414ad15acef@infradead.org>
Date: Mon, 1 Sep 2025 11:15:50 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Mark Brown <broonie@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/1/25 10:52 AM, Mark Brown wrote:
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

Wow. I just ran 'make -j8 htmldocs' on my 16 GB intel core-i7 laptop:

1205.85user 66.15system 6:05.82elapsed 347%CPU (0avgtext+0avgdata 1298044maxresident)k
697432inputs+1128016outputs (92major+16863601minor)pagefaults 0swaps

(using /usr/bin/time)

How much RAM does your build system have?

> 
> and produces a bunch of warnings with current mainline it seems.  That
> compares unfavourably with allmodconfig on this system:
> 
>   $ time make -j56 allmodconfig
>   ...
>   make -j56 allmodconfig  5.31s user 1.93s system 146% cpu 4.931 total
>   $ time make -j56
>   ...
>   make -j56  53468.11s user 4387.30s system 5084% cpu 18:57.77 total

whereas my x86_64 allmodconfig build takes over 1 hour.  :(

> and seems rather more likely to flag something for me.

OK, good to hear. Thanks.

-- 
~Randy


