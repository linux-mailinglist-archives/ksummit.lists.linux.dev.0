Return-Path: <ksummit+bounces-276-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD13BE226
	for <lists@lfdr.de>; Wed,  7 Jul 2021 06:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5A89B1C0EBC
	for <lists@lfdr.de>; Wed,  7 Jul 2021 04:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934982FAD;
	Wed,  7 Jul 2021 04:38:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F672
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 04:38:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F63B61245;
	Wed,  7 Jul 2021 04:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625632708;
	bh=m+5lAKYhUoBYYZg0dmOoPbeU3V6uSwSFjTN/VvLm6V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpFW6JF7fPu6jGYnII3DTukAQlytbTU7e0o7Dw0uv8Vg0NoVEnv4L+wWrsYZOA3da
	 A5J/6DEov0UU2NJHURghf693As/IpguDSIOTQbH/Mvln4ql1KQgvUTUNnua32938Oe
	 G/EM25FSHtvp79yrnZ6aA5nYF97LnSrsH5Zno23jqZ3lx7erhkfIMuEIQgB5uyWcdy
	 U664WAhK88LZHziLfOVoAi6jADfZlG3Edz+G7c9efejUOv1DPQpaxmZdIXwMmrFWG4
	 O43NyigVkvCgqSylz+ae8G64Tggn9pQdEHJg0Z+hwljyqlAuqvHhMvPZxdm9m0QHOr
	 UOdW/vC9bPQsg==
Date: Wed, 7 Jul 2021 07:38:23 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOUvv07ncE3/7vzl@unreal>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CANiq72nCDKQAJaPOjR167FWnrCcqnvovuHEx58Zmur6su897Qw@mail.gmail.com>
 <YORvE7Oe8fiJkjTh@unreal>
 <CANiq72ncTdSCyGXfOQ0ob4yRHx-nUJjAcLS6Zqj3hMDwKHtOeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72ncTdSCyGXfOQ0ob4yRHx-nUJjAcLS6Zqj3hMDwKHtOeA@mail.gmail.com>

On Tue, Jul 06, 2021 at 05:29:06PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 4:56 PM Leon Romanovsky <leon@kernel.org> wrote:

<...>

> > Thanks for the summary, I just disagree with the punch line:
> >  "the advantages of using Rust outweighs the cost".
> 
> That's fair, but you said you didn't know what the advantages are at
> the top of your message, so you cannot really tell if they outweigh or
> not the cost ;P

There are different levels of not knowing :). The more accurate sentence
will be: "I'm aware of general message from Rust believers, but I don't know
about advantages of Rust for the kernel and what REAL problems it solves, which
are not possible or extremely hard to solve with C."

Thanks

> 
> Cheers,
> Miguel

