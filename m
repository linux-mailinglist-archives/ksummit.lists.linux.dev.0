Return-Path: <ksummit+bounces-1201-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F17E6302
	for <lists@lfdr.de>; Thu,  9 Nov 2023 06:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF134B20BDF
	for <lists@lfdr.de>; Thu,  9 Nov 2023 05:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07116AA1;
	Thu,  9 Nov 2023 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b="xXzJaG+7"
X-Original-To: ksummit@lists.linux.dev
Received: from mail.fsf.org (mail.fsf.org [209.51.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A858612D;
	Thu,  9 Nov 2023 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fsf.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fsf.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
	 bh=+peS4VBY4EGWor8h12YXS9AConj23+2mTwIf7zUaVeA=; b=xXzJaG+77GHXS66K6QyOxC23e
	BX8LK2Tk3eAFo02Ba+l1qXHmAQvfsbt5EqnUtBMu8vkrRia49/AAP2HpYACB0YN98WiwUncHAZvIa
	7aziZtoRjnDB72XT30LL7R/TrTDTQaJ9O6LB4RQwKQLmvpmJlfCQ9PLjkQ0MQixe+9RLl2vioLDvY
	bFoWceH+poa7lj0yKcnW0ZG3ZVlFa7GIhjzgu4cGFleGajz0wBnRpeK5VNA2/T1ED5E0vCh8KncaP
	DxAcPxjnxoGWacTg6JdFmQe5tsqXD7Ct3yxDP96bAwQBBP833CajQqYMTMmZMOiQBI4jmF/C8HPfG
	4FVmBI8+Q==;
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
 <ZUkcyCb5DEVEDkKj@infradead.org>
 <20231106-mega-albatross-of-beauty-f2a7e9@meerkat>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: Ian Kelling <iank@fsf.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, "Eric W. Biederman"
 <ebiederm@xmission.com>, users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Date: Wed, 08 Nov 2023 22:55:11 -0500
In-reply-to: <20231106-mega-albatross-of-beauty-f2a7e9@meerkat>
Message-ID: <87pm0jmvbi.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Mon, Nov 06, 2023 at 09:05:12AM -0800, Christoph Hellwig wrote:
>> How about restricting access to all lists for gmail addresses if gmail
>> is so
>> broken?
>
> Today it's gmail, tomorrow it's something else. Just a month ago all
> services
> using outlook.com were broken for days:
> https://learn.microsoft.com/en-us/answers/questions/1388775/outlook-com-servers-tells-server-busy-please-try-a
>
> All I want is to know is why someone wants to receive a copy of all
> patches
> via SMTP when much more effective mechanisms to achieve the same are
> available. If someone can provide a valid reason -- such as being a
> high-profile maintainer -- then of course I'll be happy to let them
> subscribe.
>
> -K

All kinds of services go down every day, smtp has good and bad, but I
see no reason to think it should be deprecated or anything. For example,
a good is that outgoing smtp is more resilient to ddos attacks than web
servers. Part of being a sysadmin is that things keep breaking tomorrow
and the next day, and we have to keep fixing them and it won't ever
stop. Yes, sometimes migrating people to very different software is the
fix, but I have experience running smtp at lists.gnu.org and from what
I've read so far, I think the problems you've described can be
effectively mitigated without restricting subscriptions nearly as much
as you propose in a reasonable effort. I'd be happy to provide a bit of
technical assistance.
-- 
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org

