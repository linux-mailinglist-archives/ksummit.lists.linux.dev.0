Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880F7EAA3B
	for <lists@lfdr.de>; Tue, 14 Nov 2023 06:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891BD1C209A3
	for <lists@lfdr.de>; Tue, 14 Nov 2023 05:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389BBD2FF;
	Tue, 14 Nov 2023 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="MqH8ytyu"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC1D290
	for <ksummit@lists.linux.dev>; Tue, 14 Nov 2023 05:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from letrec.thunk.org (ue.tmodns.net [172.58.206.174] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3AE5kvKL030848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 00:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1699940820; bh=L/pjSAV49h0xCLyhsoEwJjGx5u5fDHhC0FcH2eNiGxw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=MqH8ytyuvldaF/ED7LkxMWReKTReU9n5ClwGsbyn/slEnuyL7Y9juSoleYWcksuRk
	 JvpKLcrGPpHaQwCxx9mnnrll4vtYDwhS6H/u+GjhoL3DQe+OsNltKazFU9mJwuuS00
	 5sUaiv316GRe2z9ptMXN76w/vDfZ2e+LWfPVgJNAY2yIUVRGU7/zRWCC5VXyRdHPn4
	 VlCHyo827xuH28fk2JjUSjDsMRUnuJ2/WSOZFvfw7F+UktdVpB1kDbiKUYSUYXxMHG
	 NSwLIa0DPAEhOOMSc88HbmPZBK1Ux7PWs9fI8lC3f2Xv58m19wvi8+1OoSSDM7Nqxm
	 nNA6oMwhFpkMA==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id E24AD8C03F0; Mon, 13 Nov 2023 15:34:27 -0500 (EST)
Date: Mon, 13 Nov 2023 15:34:27 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Prep?
Message-ID: <ZVKIU1igkgV8rSFi@mit.edu>
References: <CAHk-=whGOUw=YDsPxd9o5M_JqcisE+TjcQQ-=SLYOnHd12D0Fw@mail.gmail.com>
 <871qct4ghi.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qct4ghi.fsf@meer.lwn.net>

On Mon, Nov 13, 2023 at 12:10:01PM -0700, Jonathan Corbet wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> 
> > I didn't ask Jon before, so here goes: Jonathan?  Would you be willing
> > to take some input from people, and just scrub the names off it, and
> > forward some kind of word cloud of issues (or honestly, just the
> > otherwise unedited emails) to me?
> 
> Yes, I would be happy to do that.  I've gotten one email already;
> anybody else with something to pass on is encouraged to send it my way.

Thanks, Jon!  I was going to send out an anonymous Google Form that
invited people to send up to 3 things that they were going well, and 3
things that was making them unhappy, in preparation for a "Are
Maintainers Happy?" session (which is a spin on the "Is Linus Happy"
session that we've sometimes had in the past), but since Jon has
volunteered, lets stick with that.

I'd also like to ask attendees to think about specific proposals to
address Maintainer Burnout.  Given the very long thread about
Maintainer Burnout, we've scheduled 60 minutes on the schedule for it.

The current draft agenda is attached below.

					- Ted


			Maintainer's Summit
			 Omni Richmond Hotel
			 November 16, 2023

8:00  Hot breakfast and morning refreshments
9:00  Welcome and Agenda Bashing
9:30  Trust and Maintenace of File Systems
10:00 Next steps for Rust -- are we ready to commit?
10:30 Break
11:00 Maintainer Burnout
11:30 Maintainer Burnout (continued)
12:00 Lunch
1:30  Maintainers Support Group
2:00  Are Maintainers Happy?
2:30  Group Photograph
3:00  Break
3:30  Free time
6:00  Transportation loads for dinner

