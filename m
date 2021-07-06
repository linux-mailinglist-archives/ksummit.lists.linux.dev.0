Return-Path: <ksummit+bounces-247-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C83BD955
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5EE963E10A0
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B570E2F80;
	Tue,  6 Jul 2021 15:03:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA836168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:03:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B86B61C1C;
	Tue,  6 Jul 2021 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625583810;
	bh=DALzHOyQKNHalMbDbq8XtmWtJsXOsY1c+VXbBBXdoZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekQTmaA66EfsTmebThw+9zMaGbpYoLcF4h1M0lHu/xed9NYpENnsxGIEwaQdV+Zbw
	 muaQ8v6/q2nooM+m/VQJvADzpG9fnli4iz0y0XkkBSF3+pHJImgb9PT9Z0bcedxFw/
	 XdkNIQhOO47mP6H2QGJDtpmvOHXshYqsJCe1gS+GWYoaXnhWzjCQ8qU8lo2HywO3L+
	 TNkynz7PcnhF51QxGXBzh2zXILn1iR28upc0IDnQcisFltnhU8C125bRG0qZPAv/RT
	 ryJQqrk0zvqzrRtsdcN6c2lY1+vcZjhV48QxnbX5c+vYMv6uKgSTSD8QWiZD11t9mr
	 p9WQz42ThUL7w==
Date: Tue, 6 Jul 2021 11:03:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YORwwQJfrpNQsGT4@sashalap>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>

On Tue, Jul 06, 2021 at 04:30:06PM +0200, Miguel Ojeda wrote:
>On Tue, Jul 6, 2021 at 11:55 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> AFAIU the idea is to replace an entire piece of code in C with the
>> same piece in Rust, it's not like we are going to develop a second
>> kernel in Rust inside the kernel in C. So both/and not either/or.
>> I.e. you have to compile some pieces of the kernel written in
>> Rust to even get to a working kernel.
>
>Let me clarify this, since it is important: no, we are not replacing C
>code In fact, the Rust side is based on the C one.
>
>But that does not mean we are not rewriting a second kernel either --
>for instance, we have red-black trees "abstracted" in the Rust side by
>reusing C's API.
>
>In other words, what we are doing is "abstract" the C APIs into Rust
>APIs that can ensure as many invariants as possible statically, using
>Rust facilities for that. Thus Rust is one more consumer of the C
>APIs.

Does this mean that anyone who wishes to modify these C APIs must also
know Rust to fix up those abstractions too?

-- 
Thanks,
Sasha

