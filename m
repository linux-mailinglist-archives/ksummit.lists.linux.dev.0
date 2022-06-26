Return-Path: <ksummit+bounces-720-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CFD55AE47
	for <lists@lfdr.de>; Sun, 26 Jun 2022 04:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 1F7E62E09E2
	for <lists@lfdr.de>; Sun, 26 Jun 2022 02:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46A015C1;
	Sun, 26 Jun 2022 02:53:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6519A
	for <ksummit@lists.linux.dev>; Sun, 26 Jun 2022 02:53:04 +0000 (UTC)
Received: from letrec.thunk.org (c-24-1-67-28.hsd1.il.comcast.net [24.1.67.28])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 25Q2qSk1008604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jun 2022 22:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1656211952; bh=OTsX2Vjpt/30mQ6RydQN+q6wWDJ//7O5PDWx18WjFjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/NqfcmnEy1lTCv3ef6nBCDHskB9A0XXForuezLWl+x+Oqz007hN5VJU4QqU0KVKu
	 qNeISMVWy9O8qMQF2Fzp2/4aY5HOqzAWAtsJJj4jRB7iBYdQTTj8R35TPUj/L8Bj/D
	 ZlWvYYAqe593orpLcuxZV1QxYvocnap/j4lOt7lSUhWyvAcbPRoguJ0nCtFY4aoHb2
	 SZxTfOthVGMdy1Sm+khuSs49Mh6Q/Eax+6pTVuvGk79tGp+J6OOliDh8NSVOK+hjZC
	 AqVz8/iEAWUS7CRG5j6sVmMmM55iyazt6C5uJYF7Bf/HeF6LdS9KQRuUEEwC1O2oDM
	 8yfJXWyOnEhVg==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id BFF538C32D6; Sat, 25 Jun 2022 22:52:27 -0400 (EDT)
Date: Sat, 25 Jun 2022 22:52:27 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
Message-ID: <YrfJ63hN+htFMQVA@mit.edu>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
 <20220625124522.507a5b06@sal.lan>
 <CACRpkdY1UUqvhKj+a9hOkQo1XG27TvLqweB-EgMdrFuzP38Afw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY1UUqvhKj+a9hOkQo1XG27TvLqweB-EgMdrFuzP38Afw@mail.gmail.com>

On Sun, Jun 26, 2022 at 12:29:27AM +0200, Linus Walleij wrote:
> 
> I think it is important to keep in mind that Rust may save us
> from a few crashes when used in drivers, but that can't be the
> main target for Rust.
> 
> Rust needs to be put facing the enemy, i.e. people who exploit the
> kernel to run arbitrary code and gain local root.

In order to solve the problem you've articulated, the entire kernel
would have to be rewritten in Rust.  And that's not going to happen
for... a while.

Rust has more opportunities to improve things in drivers because (a)
they aren't tested as well (for example, it's a lot harder for fuzzers
to exercise drivers if the hardware isnt available on the VM or server
where the fuzzers are running), and (b) very often drivers are written
by less experienced engineers --- in some cases the drivers are
authored by hardware engineers.

> OK the USB protocol may be close to the driver but
> I'm thinking the network stack and I think during initial review I
> suggested things like ksmbd as Windows SMB is known to have been
> exploited by intelligence agencies we know things like that is facing
> the enemy. I don't know what the ksmbd people feel about that, or
> nfsd for that matter, but this kind of code is what matters most
> for Rust deployment to pay off.

ksmbd needs to interface with a large number of subsystems that are
written in C.  So even if you rewrite ksmbd in Rust, it will need to
made a huge number of unsafe calls into C code.  Speaking personally
my solution for ksmbd is "Just Say No".  Obviously, that won't be a
solution for everyone, but if you want a short-term solution, and you
care more about security than performance, I'd suggest using a
userspace file server, such as Samba or Ganesha.

Cheers,

					- Ted

