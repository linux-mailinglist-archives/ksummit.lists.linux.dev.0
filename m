Return-Path: <ksummit+bounces-1139-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 347757A338F
	for <lists@lfdr.de>; Sun, 17 Sep 2023 03:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4021C20901
	for <lists@lfdr.de>; Sun, 17 Sep 2023 01:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CA8EC5;
	Sun, 17 Sep 2023 01:40:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC043A3D
	for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 01:40:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 400071F8D5;
	Sun, 17 Sep 2023 01:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694914823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT8YRi2Titf3rpNbwZIeL6+A8daQTFg7Tzj2F5eWSts=;
	b=AdESY5bMlbpN5CAnUyYlSxWTsOFGCWNG8XQh7H6yqxsigaKoStwAsRBg5/4TLoNGkKg4ay
	Lh02z5MGNKLadBUZJd+hwZAM96al8yWmVGhl2YuGtFAweBRfn1pKs8lTL66sgSqHeoRljo
	QkOCxxaGwC4bu0JHOHk3D9r55v8UuZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694914823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT8YRi2Titf3rpNbwZIeL6+A8daQTFg7Tzj2F5eWSts=;
	b=pYHduALx3bvO6BLwzcyJ+KcHm1RsrI+Z0b0aMY9Lt4YNxF48zF6VX6Ll6XjU893b7tEEGC
	XRYFhdgBe5QAJzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 297C213499;
	Sun, 17 Sep 2023 01:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AotfMwNZBmXjYwAAMHmgww
	(envelope-from <neilb@suse.de>); Sun, 17 Sep 2023 01:40:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Dave Chinner" <david@fromorbit.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Eric Sandeen" <sandeen@sandeen.net>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Guenter Roeck" <linux@roeck-us.net>, "Christoph Hellwig" <hch@infradead.org>,
 ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
In-reply-to:
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
References: <ZO9NK0FchtYjOuIH@infradead.org>,
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>,
 <ZPkDLp0jyteubQhh@dread.disaster.area>,
 <20230906215327.18a45c89@gandalf.local.home>,
 <ZPkz86RRLaYOkmx+@dread.disaster.area>,
 <20230906225139.6ffe953c@gandalf.local.home>,
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>,
 <20230907071801.1d37a3c5@gandalf.local.home>,
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>,
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>,
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>,
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
Date: Sun, 17 Sep 2023 11:40:16 +1000
Message-id: <169491481677.8274.17867378561711132366@noble.neil.brown.name>

On Sun, 17 Sep 2023, James Bottomley wrote:
> On Sat, 2023-09-16 at 08:48 +1000, Dave Chinner wrote:
> > On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
> [...]
> > >  - "they use the buffer cache".
> > > 
> > > Waah, waah, waah.
> > 
> > .... you dismiss those concerns in the same way a 6 year old school
> > yard bully taunts his suffering victims.
> > 
> > Regardless of the merits of the observation you've made, the tone
> > and content of this response is *completely unacceptable*.  Please
> > keep to technical arguments, Linus, because this sort of response
> > has no merit what-so-ever. All it does is shut down the technical
> > discussion because no-one wants to be the target of this sort of
> > ugly abuse just for participating in a technical discussion.
> > 
> > Given the number of top level maintainers that signed off on the CoC
> > that are present in this forum, I had an expectation that this is a
> > forum where bad behaviour is not tolerated at all.  So I've waited a
> > couple of days to see if anyone in a project leadership position is
> > going to say something about this comment.....
> > 
> > <silence>
> > 
> > The deafening silence of tacit acceptance is far more damning than
> > the high pitched squeal of Linus's childish taunts.
> 
> Well, let's face it: it's a pretty low level taunt and it wasn't aimed
> at you (or indeed anyone on the thread that I could find) and it was
> backed by technical argument in the next sentence.  We all have a
> tendency to let off steam about stuff in general not at people in
> particular as you did here:

It may have been low-level, but from such a high-profile individual it
carries considerable weight.  It carries real risk of appearing to give
permission for inappropriate childishness - or worse.

I'm not sure the technical argument was particularly coherent.  I think
there is a broad desire to deprecate and remove the buffer cache.  I
think the "technical argument" comes down to "don't remove it, just
ignore it if you don't like it" which hardly seems like a good idea for
overall project management.
A much better (in my opinion) technical argument is that the buffer
cache (which isn't all that much code) can simply be copied into each
filesystem which really cannot be modified to use whatever the current
preferred abstraction is.

NeilBrown

> 
> https://lore.kernel.org/ksummit/ZP+vcgAOyfqWPcXT@dread.disaster.area/
> 
> But I didn't take it as anything more than a rant about AI in general
> and syzbot in particular and certainly I didn't assume it was aimed at
> me or anyone else.
> 
> If everyone reached for the code of conduct when someone had a non-
> specific rant using colourful phraseology, we'd be knee deep in
> complaints, which is why we tend to be more circumspect when it
> happens.
> 
> James
> 
> 
> 
> 


