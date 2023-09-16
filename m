Return-Path: <ksummit+bounces-1138-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E167A32C9
	for <lists@lfdr.de>; Sat, 16 Sep 2023 23:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20F2C2817C6
	for <lists@lfdr.de>; Sat, 16 Sep 2023 21:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DF11C29D;
	Sat, 16 Sep 2023 21:50:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF01BDDF
	for <ksummit@lists.linux.dev>; Sat, 16 Sep 2023 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1694901052;
	bh=xp/zECTLd0zlyMcEqIwVZY7AO4haOGbqNU1Y5VuW/LA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WjSxsnF+cGzfk7CY5jUq6IYscszVWtuEO7fI6pa31IK7S9YcNjjfNa9pAzb8CeKqR
	 XaZVFxMeyWhypQBtBtxXjombHjTeBrdf8e7sXAzb3IZCsBj0ORJxsCalDQ6rZhyEvR
	 wiJO4p7xcraCClR5IyakbV5MS80aVtj1csyuevvI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C067E12861E5;
	Sat, 16 Sep 2023 17:50:52 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Hn9t_FtsVQ6r; Sat, 16 Sep 2023 17:50:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1694901052;
	bh=xp/zECTLd0zlyMcEqIwVZY7AO4haOGbqNU1Y5VuW/LA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WjSxsnF+cGzfk7CY5jUq6IYscszVWtuEO7fI6pa31IK7S9YcNjjfNa9pAzb8CeKqR
	 XaZVFxMeyWhypQBtBtxXjombHjTeBrdf8e7sXAzb3IZCsBj0ORJxsCalDQ6rZhyEvR
	 wiJO4p7xcraCClR5IyakbV5MS80aVtj1csyuevvI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C058712861BA;
	Sat, 16 Sep 2023 17:50:51 -0400 (EDT)
Message-ID: <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dave Chinner <david@fromorbit.com>, Linus Torvalds
	 <torvalds@linux-foundation.org>
Cc: Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt
 <rostedt@goodmis.org>,  Guenter Roeck <linux@roeck-us.net>, Christoph
 Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org
Date: Sat, 16 Sep 2023 17:50:50 -0400
In-Reply-To: <ZQTfIu9OWwGnIT4b@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
	 <ZPkDLp0jyteubQhh@dread.disaster.area>
	 <20230906215327.18a45c89@gandalf.local.home>
	 <ZPkz86RRLaYOkmx+@dread.disaster.area>
	 <20230906225139.6ffe953c@gandalf.local.home>
	 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
	 <20230907071801.1d37a3c5@gandalf.local.home>
	 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
	 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
	 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 2023-09-16 at 08:48 +1000, Dave Chinner wrote:
> On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
[...]
> >  - "they use the buffer cache".
> > 
> > Waah, waah, waah.
> 
> .... you dismiss those concerns in the same way a 6 year old school
> yard bully taunts his suffering victims.
> 
> Regardless of the merits of the observation you've made, the tone
> and content of this response is *completely unacceptable*.  Please
> keep to technical arguments, Linus, because this sort of response
> has no merit what-so-ever. All it does is shut down the technical
> discussion because no-one wants to be the target of this sort of
> ugly abuse just for participating in a technical discussion.
> 
> Given the number of top level maintainers that signed off on the CoC
> that are present in this forum, I had an expectation that this is a
> forum where bad behaviour is not tolerated at all.  So I've waited a
> couple of days to see if anyone in a project leadership position is
> going to say something about this comment.....
> 
> <silence>
> 
> The deafening silence of tacit acceptance is far more damning than
> the high pitched squeal of Linus's childish taunts.

Well, let's face it: it's a pretty low level taunt and it wasn't aimed
at you (or indeed anyone on the thread that I could find) and it was
backed by technical argument in the next sentence.  We all have a
tendency to let off steam about stuff in general not at people in
particular as you did here:

https://lore.kernel.org/ksummit/ZP+vcgAOyfqWPcXT@dread.disaster.area/

But I didn't take it as anything more than a rant about AI in general
and syzbot in particular and certainly I didn't assume it was aimed at
me or anyone else.

If everyone reached for the code of conduct when someone had a non-
specific rant using colourful phraseology, we'd be knee deep in
complaints, which is why we tend to be more circumspect when it
happens.

James



