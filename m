Return-Path: <ksummit+bounces-721-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40855AE6F
	for <lists@lfdr.de>; Sun, 26 Jun 2022 05:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA05280A9C
	for <lists@lfdr.de>; Sun, 26 Jun 2022 03:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288D917CE;
	Sun, 26 Jun 2022 03:19:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F419A
	for <ksummit@lists.linux.dev>; Sun, 26 Jun 2022 03:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ujnZBVemzpIfAkYjmZnVIr5Gv0ed9tEb9t3o8qrBMlI=; b=E3eH8rx4gcJPtdtOzPmIU5bll5
	LQze/gi4UOTbknpq62BrmPENXos7HT/i0uKkuj6IY3WNzWpPtW8qwiTUKGjjro9KGS3wx6M1Om+j1
	3Ng7YbMh+eXqHHjRBHUkCzTeIfPXEVXHH3SV5/o7bomRwWPL9HqJWJnZZb2siyqXcEtMP7nOsA72l
	nfydQyZismHfXjtFLLUl94FzrjDZfLNzlKD9PaIpWiTZ1l76siEwz5/WCiMsOgwHVh12b4y1KyVjI
	3qvUeUveHD0YegcNn9kvsFI57htbEyx7/tbozTXKXrNJVl0TXbBD4Eic5PFpzY2nYMlsvQ+Q9PNWI
	l8vaGwwg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1o5Ina-004b8L-Rd;
	Sun, 26 Jun 2022 03:18:58 +0000
Date: Sun, 26 Jun 2022 04:18:58 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
Message-ID: <YrfQItBxCWlvSfOq@ZenIV>
References: <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
 <20220625124522.507a5b06@sal.lan>
 <CACRpkdY1UUqvhKj+a9hOkQo1XG27TvLqweB-EgMdrFuzP38Afw@mail.gmail.com>
 <YrfJ63hN+htFMQVA@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrfJ63hN+htFMQVA@mit.edu>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jun 25, 2022 at 10:52:27PM -0400, Theodore Ts'o wrote:
 
> ksmbd needs to interface with a large number of subsystems that are
> written in C.  So even if you rewrite ksmbd in Rust, it will need to
> made a huge number of unsafe calls into C code.

Not to mention the fact that ksmbd bugs I've seen so far had nothing
to do with "memory safety" and they would translate into Rust just
fine, TYVM, even if the stuff outside of ksmbd had also been all in
Rust...

