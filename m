Return-Path: <ksummit+bounces-298-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D82ED3BEBE3
	for <lists@lfdr.de>; Wed,  7 Jul 2021 18:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 915333E1049
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5502A2F80;
	Wed,  7 Jul 2021 16:18:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8B168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+lL1sMl4UfMHx+4Q9ox8Th4nweqnEiBZaIEXtqzXuvE=; b=YdLIZLt4801AVgythgYqVTxnKI
	in8mEJRPHaSe7EdZojJLD/h2kCePEjvNjRVn9feeSEmafzNXI7awItFzUTXSWj6Qo9kO9z3W65hxD
	hkOlKvOQob5/6Pap0cu1h5Uc9uXlklgREf7+il0XwED2ubgta79w8rZwLc4qK85Fpv3I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1m19ob-00CXKJ-Dc; Wed, 07 Jul 2021 17:50:21 +0200
Date: Wed, 7 Jul 2021 17:50:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOXNPWYN45pphSZ4@lunn.ch>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CAMuHMdU5FOdSj+-d38t3BuPrZsYF0YT-Ff1efYLS3W7yNN_Y6Q@mail.gmail.com>
 <CACRpkdbr9orKFfDmwZDz1wPHZvUfSaDVJtJB1uz+2Ho=QZFGiQ@mail.gmail.com>
 <CANiq72no33T6RXMyZ18bS_nVaUcOpWEmu15Bs=+zJPnnhrnYRA@mail.gmail.com>
 <CAK8P3a1UZ9kdyokJWYxdsn-3doO6gVw9Saivm2Adv6P_=xS8jg@mail.gmail.com>
 <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n0AHks543X7U58Rmtujptcj5TxjNYq4=9Hs6bGmTAZSg@mail.gmail.com>

>   - Only a single version of `rustc` is supported per kernel release
> (until we stop using unstable features), so that at the very least
> would cut down things by 7.

How does that work with -stable? Are you saying that rust patches
which are backported to an earlier kernel also need to be backported
to an earlier rustc?

   Andrew

