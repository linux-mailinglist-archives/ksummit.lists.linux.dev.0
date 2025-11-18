Return-Path: <ksummit+bounces-2629-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D66C6B6B6
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17B14340242
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D68E2D6E51;
	Tue, 18 Nov 2025 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="YyyFoxxt"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472071DC1AB;
	Tue, 18 Nov 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493590; cv=none; b=uhzWBq8hwBqHL2Sseca6s8WFkwzsJdKkTIBqnHQYiFRpWdHqMjc3U8wYouBrSkj+9U6kfoNd3zAEos1QaeJ2TmXV2oNQqGbXU9APO3g71bAmdoizdCKW92jtkXOllpHZGcOHijdbwOHaIQRCEi3tiqRGUc6xpxVjVDc0BB+ThCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493590; c=relaxed/simple;
	bh=gCZktxy3EsfeQuR2eEEkB8NKqvMxyH0K+F5rR3aPI+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsc7Bb3Trwdx7qzZ5shl+pPHkuTVkiM5EBxWf+dAm3K3CT4TkmqdyWTJKRCG23B/QByz2Ic8yt8M0rzlFbLcSj28II6uEHzryjygLekoFXCxSIiICmqs8KEEn9HBtgL8YW1znoT5mQbgASyyfwrNJUWMtxZJ+JCmsnRErM0qNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=YyyFoxxt; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:7ccc:663a:75c9:3b5f] ([IPv6:2601:646:8081:9484:7ccc:663a:75c9:3b5f])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AIJJYxJ994659
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 18 Nov 2025 11:19:37 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AIJJYxJ994659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1763493581;
	bh=BM9yZnRoOGYl9ZscXhY5n8YUXuAIVccxB0k3vLMEQZ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YyyFoxxt7P3pKmG4lbCN952E4491MIZ6Atbfkxf7n5jwziNcYrhS+B+KExkVRWvfT
	 4e/4jo194VKhj/ppu9ADnY5fybYS0x/osWqh2rvZ3jlY14HtFAIJ8FK++EwV9fgkK4
	 0eDd1UxrzZOxYIU9NEtpehL6fnHRRJZBOKua9Kmeui5jWJoeA8hXnyNAilNmTUA525
	 c2x4SP+G3GlQXKvwWLvmBkI9lHw856pEnX94aoof8caMS7WHCRchLjsGbdlz+ErAew
	 BvS4IlaqR/uNRGDVIiGLxY3WbTz9BP4SkJXiFsYJM/k70JS+wv2hDlDG94/0n6PD2k
	 H1L06k2jzg91g==
Message-ID: <00a4e7b8-f292-440a-9c08-df802fd52d81@zytor.com>
Date: Tue, 18 Nov 2025 11:19:29 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
 <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <f895328e-43f3-426b-ab2b-ee750edab324@zytor.com>
 <CAHk-=wjvPScU4HrhFL9dusAOLRA0E1qi2t6tEo2mJ0Tvghkd2A@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAHk-=wjvPScU4HrhFL9dusAOLRA0E1qi2t6tEo2mJ0Tvghkd2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-11-18 11:16, Linus Torvalds wrote:
> On Tue, 18 Nov 2025 at 11:11, H. Peter Anvin <hpa@zytor.com> wrote:
>>
>> Do you want me to send you the patchset during the merge window?
> 
> Sure. I don't think it's a high priority, but I do think it's an
> improvement and allows people to write clearer code.
> 
> I assume all the conversions got acked?
> 

I think so, and most importantly, the only one which wasn't mechanical (at the
maintainer's request.)

However, as long as the actual definition patch gets in there any subsequent
conversions can also go through maintainer trees if they prefer.

	-hpa


