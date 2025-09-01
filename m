Return-Path: <ksummit+bounces-2247-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F32B3ECAC
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068961B20B6A
	for <lists@lfdr.de>; Mon,  1 Sep 2025 16:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCD32EC083;
	Mon,  1 Sep 2025 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V+EOHgAe"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85A82DF13C;
	Mon,  1 Sep 2025 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745467; cv=none; b=IX8Zg01+BNsBlx+CZfk+vTedoy7hTrX9rrGWgcFgRgVZiKKXVaoYk3MScmfidp9iUzF5ld3CWWkhVYiupCgF4Xhqkg20Dqi4RZGyjbslODoyl2T2uC0XzDH961aVstKocREahNfwRjZ64o2mFoiAE+cbcFl55gAmlOfzc2Hfk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745467; c=relaxed/simple;
	bh=0ACn8y5z9Q7xqvEt6H8elcPFHaqoG0OA0yeIlGyzM+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewYGs+RtWSkvTEQsFDzlnoTYqwe0UlDcc7Wx4B4pQczGwscARyl/bnQih0T+0P/fQN87Ykzv9OfEZ2WhLiQP46/EePzrD/mChRpopoKpcPDCy0/XOPezrZcGuPiwynuguwtUK+NNdS/9mhPx0CiEdPfJ3IWJTmJ2szDuEdDdbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V+EOHgAe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sno7pd+C651TxsuDvfdJJyH7RZcvDOS0q/0I4MPdd4Q=; b=V+EOHgAe05Osyic0p/qgYKBZwi
	JxWBtPuMIyEhaDY1ePQofZmxrSxYjkLn9DZ5pKeJtn2dLBtEuU4w9Qevg44OvOeyWhOjK4a7uRBMK
	Gjdbd3BLgEs3ntWIDFBkeeh2Fy6t9UvAreHM+gCyDhI86zls0/T/nV6jGN+8Sse3JZBsW8QoMQhyr
	vkM13p9QM0J21ZhUdrb5DPGgQSZP2OzVwVdc4ZrGY9n9TdQflrMGJ1hIvmGKtmCX//mLLcYnu15JN
	TrC73BBW7B2nFp4AXbZkpys5eEVuNH0j3NU/jMrWqKL2ESIGXgvzCcueFObL7eJo1omn/ouv5J/Pk
	DJ4l2SwA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7kD-0000000DM2u-2ptM;
	Mon, 01 Sep 2025 16:51:01 +0000
Message-ID: <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
Date: Mon, 1 Sep 2025 09:51:01 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/25 3:09 AM, Jani Nikula wrote:
> On Sun, 31 Aug 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
>> kernel-doc now can parse the entire tree with:
>>
>> 	$ scripts/kernel-doc .
>>
>> Someone can easily use it to discover the current gaps at the docs that
>> have already some kernel-doc markups and identify what of them aren't
>> yet placed under Documentation/ ".. kernel-doc::" markups.
>>
>> So, I'd say the first step here would be to ensure that 100% of the
>> docs are there somewhere. Alternatively, we could place all the rest
>> of functions with kernel-doc markups outside Documentation inside an
>> "others/" book - or even "<subsystem>/others/", and then gradually move
>> them to the right places.
> 
> I don't agree that all the kernel-docs need to be in the html build in
> the first place. Some of them would be better off with a simple
> non-structured comment instead. For example, most static functions. Some
> of the kernel-docs are useful for the structure the format provides, but
> still having them in the html build is overkill. For example, many
> complex but driver specific functions.


IMO there are far too many static functions that use kernel-doc notation.
I certainly don't want to discourage function documentation, but I don't
think there was any ever intent to have those functions added to the
kernel docbooks.


> I think the API documentation in the Sphinx build is primarily useful
> for kernel generic and subsystem APIs, or overviews of
> functionality. But nobody's looking at the Sphinx build for highly
> specific and isolated documentation for individual structures or
> functions.
> 
> I'd say emphasize quality over quantity in the Sphinx build. An
> overwhelming amount of (in the big picture) insignificant API
> documentation does not make for good documentation.
> 
> That said, there *are* a lot of kernel-doc comments that absolutely
> should be pulled into the Sphinx build. But don't be indiscriminate
> about it.
> 
> ---
> 
> I think a more interesting first step would be ensuring all the
> kernel-docs we do have are free of kernel-doc and rst warnings. Because
> they should be, and this would make them easier to pull into the Sphinx
> build as needed.

ISTM that there are lots of non-docs developers who either just don't care
about that or never run 'make W=1 htmldocs' to see the problems in their
drivers or subsystems. OK, maybe it's just a very low priority for them.

Willy had a suggestion that we just make checking kernel-doc during
all .c builds a permanent feature instead of a W=1 option.
This helps, but still doesn't force 'make htmldocs' to be run.

And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
build.

> Currently we only have the kernel-doc checks in W=1 builds for .c
> files.
> 
> The i915 and xe drivers have local Makefile hacks to do it for more than
> just W=1 builds and also headers. The attempts to expand the header
> checks to the drm subsystem, however, failed infamously.
> 
> And still none of this checks for rst. But now that kernel-doc is
> python, it shouldn't be too hard. Probably needs a dependency, but it
> could only depend on it when passing some --lint-rst option.
> 
> Having this in place would also reduce the churn caused by merging
> broken kernel-doc. It's fast enough to be done as part of the regular
> build, while most people don't run the entire Sphinx build as part of
> the development flow.

-- 
~Randy


