Return-Path: <ksummit+bounces-269-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8F3BDE9C
	for <lists@lfdr.de>; Tue,  6 Jul 2021 22:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 831A71C0EE8
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D3A2FAD;
	Tue,  6 Jul 2021 20:47:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70BE168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 20:47:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D3061C9D;
	Tue,  6 Jul 2021 20:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625604425;
	bh=wPKAh35pXjebLonzmCf3fKKg/b9Z1SOduQLOOmLmOOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pai6uJOSKlOSzpz+VGa+q3uD1FBtDYrzjPPGe9w7fwUFI+6bmKnb7HSgkzI7pt49L
	 R9J4jeZIWvqywNGF2GRy+LeHcQkckTykVHCiYhwq6OmRn7fOG1b8056ds9wFjWFlDl
	 QWBYwARN7SZ/bl4kiufL9edoKkKWD52u93tDe1nnfNLdlJfJQ1ZmJz89AuyxqCcoWV
	 nOD66gRPFQebs5TlYvPiS8SbMz5lV21/DxLv1DKbHfCqzGJn5EXcuUR3QY3u7jNVj3
	 fCfoujb94J5lVN1oEtSvP6Rm+vLFFvfCusnQDIZ8K1aRDnQFJhwF8NKLGArifv7yqB
	 TEedDhfPORY2g==
Date: Tue, 6 Jul 2021 14:53:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOSmkgFpSUWtf2ue@sashalap>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>

On Tue, Jul 06, 2021 at 05:33:42PM +0200, Miguel Ojeda wrote:
>On Tue, Jul 6, 2021 at 5:03 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> Does this mean that anyone who wishes to modify these C APIs must also
>> know Rust to fix up those abstractions too?
>
>Please see my answer to James and Leon, i.e. if we have abstractions
>for a particular subsystem, it should mean somebody is happy to write,
>use and maintain them.

I strongly disagree. If we have abstractions for a particular subsystem
all it means that someone at some point did that work, nothing more than
that.

That someone might have moved on, working elsewhere, retired, etc, and
those abstractions are living orphaned in the kernel.

>That means that, yes, for subsystems that have Rust abstractions, if
>you want to touch the C API, you also need to do so for the Rust
>abstractions. But for any heavy refactor, I would expect maintainers
>being the ones doing it, or at least helping to do so if somebody else
>wants to change something in the C side and does not know how to
>update the Rust side.

That's quite an ask. If the driver work goes in and I want to touch the
driver API, I need to get Greg KH to write code for me?

-- 
Thanks,
Sasha

