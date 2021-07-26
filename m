Return-Path: <ksummit+bounces-473-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A73D690D
	for <lists@lfdr.de>; Mon, 26 Jul 2021 23:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 812A91C063A
	for <lists@lfdr.de>; Mon, 26 Jul 2021 21:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1E62FB2;
	Mon, 26 Jul 2021 21:54:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F3172
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 21:54:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C74D22072;
	Mon, 26 Jul 2021 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627336435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9Eax8tO7kdHBAqOfn6Jrz1j5wL7j+3tjavdXKbnGYE=;
	b=Eyqa0wP4gUiudfKIMq+flyWLmUecCpQUdYazcVX08LjFPiHnflLtlldBiEP9PGRYw/W1yp
	le7M3Dd+tYOxIdqKriRBfgNEbW95T2hg0Ao2BioaauZJ1hdIT/iIV53S6SuglU/7jUv0Sa
	yobd2ZYUNGX2mKyd5ZlvUeejJ1f776A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627336435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9Eax8tO7kdHBAqOfn6Jrz1j5wL7j+3tjavdXKbnGYE=;
	b=EVvJz6B1IRVu6JUqTRA2bmzqsr8dYFAX00V/C3l+yzz+XPlXw0+A+UGnfMQnJnbqpQ1qXg
	EC4YDzgtbAD0v6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C198713B58;
	Mon, 26 Jul 2021 21:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8JtAH/Au/2D9RQAAMHmgww
	(envelope-from <neilb@suse.de>); Mon, 26 Jul 2021 21:53:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, "Hannes Reinecke" <hare@suse.de>,
 "Julia Lawall" <julia.lawall@inria.fr>, "Arnd Bergmann" <arnd@arndb.de>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Dan Carpenter" <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
In-reply-to:
 <CAHk-=wh1-KNDZn38e7OFdkGCRmtAx=wVp0ZRSKHh6zioWoZV+w@mail.gmail.com>
References: <20210723191023.GG25548@kadam>,
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>,
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>,
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>,
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>,
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>,
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>,
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>,
 <633614dd-dd88-03f0-c463-d97036c58216@suse.de>,
 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>,
 <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>,
 <CAHk-=wh1-KNDZn38e7OFdkGCRmtAx=wVp0ZRSKHh6zioWoZV+w@mail.gmail.com>
Date: Tue, 27 Jul 2021 07:53:49 +1000
Message-id: <162733642991.4153.12959746307003856354@noble.neil.brown.name>

On Tue, 27 Jul 2021, Linus Torvalds wrote:
> 
> Anyway, gcc has this completely ass-backwards "nonnull" function
> attribute, sadly it's pure garbage. It's not a "type of this pointer"
> thing, it's a "this function does not take NULL as argument X" thing.

Yeah, I found that annoying too.  It seems to be purely about
optimization.  Marking a function parameter as "nonnull" means the
compiler can optimize away any tests against NULL.

> 
> We could relatively easily add a "__nonnull" type attribute  (and
> "__errptr") and parse it in sparse, but it would be _all_ over the

sparse already parses __attribute__((safe)) which seems to mean
something like __nonnull.  It needs a bit of work to make it useful.

> place, and without real compiler support it's probably not worth it
> (people already don't run sparse all that much, and a lot of the
> things sparse can warn about are too verbose to be be used in
> practice).

I'm not convinced that "real compiler support" is essential.
checkpatch.pl does provide some value despite not being "real compiler
support" and not being mandated.

NeilBrown

