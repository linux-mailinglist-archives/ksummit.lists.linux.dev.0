Return-Path: <ksummit+bounces-2623-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727BC6B571
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84D414E1B42
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5751D2DCBF8;
	Tue, 18 Nov 2025 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="AW1kO3/P"
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF426ED55
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492707; cv=none; b=l2uWQswqL9xgdL1Id2OAT07UId3pUo38jwFjjdkP871lDIVnV7es4abObD4DYi9JeVqbkW/9UoN4vULg6xhnIl3Ahjw/GtMc8Awj4r10V4TBtC3zBrkcONfN7FHKSud++ffKFkg2sY1eO0xj5frS41eJGcmD7SPhF/CPQWotnLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492707; c=relaxed/simple;
	bh=PWUoTPxgTGrd22pUUVAjKA7L/lOQwgcRsMNi4y5drAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoUTF2OekaKLDOIMM1H4DbrevCxpXRvbr+Q//CH+jP36wgkKqwv8eIXY4S95yhoW68XMG9ousXNUYl8d0P4VXxngRJekKM+bsebwIl1kUNqVDWMPp3R7Puks/YvMJMY6UVMeTVq3ze/phcYXbTY1YoqVEt4wepbq5BYxQwOk+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=AW1kO3/P; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4d9vFD1HR1zlrnRy;
	Tue, 18 Nov 2025 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1763492702; x=1766084703; bh=iBPKc1vtFwp6s3DUlntEDQ4v
	tfuHywzkPij5uzF01Rc=; b=AW1kO3/PpUnaKMUzTou+nAhwEhKnSoJefsJzac+g
	6Xt5RTT1XCg4X84oPt64Ab+fDVP4n/AXceq6VCXHt4ajfu9M/L3+xj6NvAlDYK45
	0FfWY/eyRe+oRp929mepkQ2D4ij+6MlXcmqAD56gE/Bp69KckVJswzD/qJq6WFtQ
	AFaJAnd+D/RBF32woVltKznbi53Igf5G+zZiLug++is5Z+vo+YGhl2pbT7u/0bVK
	SG9rFmUSbnsOYIbagSDNB+4g1TJhBlwL0luJ1ETbL2mvE4AZI7m9qd+SlzcoPd1+
	9wqowDtP1p3xlMg2oeYMc8Y5ibK71O0xpz1ZjrPxKE4I8Q==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kQlYlsT2P_v8; Tue, 18 Nov 2025 19:05:02 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4d9vF55d8yzlrnS8;
	Tue, 18 Nov 2025 19:04:56 +0000 (UTC)
Message-ID: <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
Date: Tue, 18 Nov 2025 11:04:55 -0800
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
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
 <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 10:38 AM, Linus Torvalds wrote:
> Now, we currently don't use __auto_type very much outside of macros
> (and there we often use "typeof(x)" instead for historical compiler
> reasons), but I suspect we probably should.  There's a patch floating
> around that makes it more convenient with a
> 
>     #define auto __auto_type
> 
> because the historical C 'auto' keyword has been so completely and
> utterly useless.

In a C++ style guide I found the following advice for type deduction:

"Use type deduction only if it makes the code clearer to readers who
aren't familiar with the project, or if it makes the code safer. Do not
use it merely to avoid the inconvenience of writing an explicit type."

However, I'm not sure whether this guidance also makes sense for C 
kernel code. See also
https://google.github.io/styleguide/cppguide.html#Type_deduction

Thanks,

Bart.

