Return-Path: <ksummit+bounces-1166-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5C7A6C66
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48351F20FEC
	for <lists@lfdr.de>; Tue, 19 Sep 2023 20:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1176347BA;
	Tue, 19 Sep 2023 20:39:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626B1EA78
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 20:39:27 +0000 (UTC)
Received: from letrec.thunk.org (c-73-8-226-230.hsd1.il.comcast.net [73.8.226.230])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 38JKdCJT006564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 16:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1695155955; bh=47Fs3yNkxEjA+go+LPhp3K3ImVWaS8B8Ww8veYYfRrA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=nMYAWSrE2MpByE0DoZnanGcBvEEQ1SU8SHuXShb4sVOk/ChL+yS0pGovPGkCS/gXr
	 kxNlVBRfeB5yH7YADhBuzGxe7JZ1CLPXo2UuE6bE1u6qKc3SunKVunrQxhF5eorMyc
	 vbJtBBzDv7WN+ssXd7ei5LfTW3a/FHeyhLJ5B8YGgnsj/VkvQLG2y12v1545VIzdf7
	 Ei+6OsffZroqp1T97LayDo7J9Q309Ix0ViYOqatPqiL4Dwonhz7NDl0WoGSS21jeop
	 c6CeOPze8dQxiNAIKv7TKwaYjpnBH01UGUjana2omQySbQDfWK+18r504zYT2C6EvL
	 q4xLb3y/kNasg==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id F2DD58C0385; Tue, 19 Sep 2023 16:39:11 -0400 (EDT)
Date: Tue, 19 Sep 2023 16:39:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Shuah <shuah@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
        tech-board-discuss@lists.linux-foundation.org
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Message-ID: <ZQoG71Vdy9iLAcY1@mit.edu>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>

On Tue, Sep 19, 2023 at 10:52:40AM -0600, Shuah wrote:
> As a member of the CoC, I respectfully disagree with the statement "but all the
> focus has mainly been around telling maintainers how to behave." This impression
> might have been the result of one unfortunate incident that took place last year.
> is only part of what CoC has been doing.
> 
> A majority of reports are related to incorrect understanding of how the community
> works and discusses technical issues. Most of them get resolved without involving
> the community. This is behind the scenes silent work CoC does.
> 
> It is unfortunate that CoC is being viewed as a body that is focused on telling
> maintainers how to behave. I would encourage to not view CoC work based on one
> or two cases that were outliers. CoC worked very hard to resolve them fairly and
> that benefited the community as a whole.

Shuah, I don't think this is the fault of the CoC.  Much of it is in
how people interpret the CoC, or think it should be adapted.  For
example, just this past week, on the maintainer's summit, this
statement:

>Waah, waah, waah. The buffer cache is *trivial*. If you don't like the
>buffer cache, don't use it. It's that simple.[1]

... resulted in Linus being accused as a CoC violation.

I'm not sure that it qualifies as a CoC violation, but Dave Chinner
certainly thought so, and publically accused Linus of that[2].

Personally, I'm not convinced that people calling people out for real
or imagined CoC violations is always going to be productive,
especially when it wasn't an explicit personal attack.  It's these
sorts of edge cases is what causes some people to fear and badmouth
CoC's.  Which is, I think, unfortunate.

[1] https://lore.kernel.org/all/CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com/
[2] https://lore.kernel.org/all/ZQTfIu9OWwGnIT4b@dread.disaster.area/

						- Ted

