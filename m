Return-Path: <ksummit+bounces-2407-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D004B8074E
	for <lists@lfdr.de>; Wed, 17 Sep 2025 17:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F1E46532F
	for <lists@lfdr.de>; Wed, 17 Sep 2025 15:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEC5333AA7;
	Wed, 17 Sep 2025 15:15:16 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9A333A85
	for <ksummit@lists.linux.dev>; Wed, 17 Sep 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122116; cv=none; b=JoWBardJ/tU09pKsyTtbVYw7+0jXfqJMNXFBB8tyfEOTKBLSYNpkgZ4rscpyKTk7tDrf6UlAQqT72maC7fTAF0l86VNgntXYhEDn00lb/iu8Twr8YTSZjrIqhRna/+fy3WW3Y7GuWY2FVg8QpFP3ZOTZNb0kakQjJFF64b0hnpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122116; c=relaxed/simple;
	bh=zrplddxPxL+fslxsCcrIKT9HXCQdh6TgSYEGKd7nQ4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgRIUEmZyLM8TcVg8zFrsACY1zJ0YmGSpwtFvtY0qEqTNxsqaMt/MAvvCenyJwFAg+adj5UqQa1DDRhPdFLNbB549+fu1RbdO2fGTWzMhwiaGR2poQdpAwQ1gGlyP1sIUDapR8tPERWvrF7Nu+kXHrvsBxfj7I0srLGHRiOCek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 5D0541DF2FD;
	Wed, 17 Sep 2025 15:15:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id AF5C731;
	Wed, 17 Sep 2025 15:15:05 +0000 (UTC)
Date: Wed, 17 Sep 2025 11:16:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <kees@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250917111610.6f2ebc75@gandalf.local.home>
In-Reply-To: <202509161626.AA26A66@keescook>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<202509151019.CD7AA0C0BE@keescook>
	<20250916102022.5bc75a36@gandalf.local.home>
	<202509161626.AA26A66@keescook>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: AF5C731
X-Stat-Signature: pswdpk4whobiu48zfruxhg6zr1of6qkk
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18/wWURaqMDGW8/mJu6H3YPZp96yKklJnE=
X-HE-Tag: 1758122105-150812
X-HE-Meta: U2FsdGVkX1+Esi5Sb9gXigmL2lxns1p+PuQ+KfLl3BCxUCYlW29CcQcdHH0sfeh+/rKVgfeUlJYkej1wzK1GfX9iPhKVAsWTLBsPPHm3Lk9/1TtH7YbzxW0cP+COLJ2zg5Ipx0bcIellY4gVqpJptmYocOQDCiogvyIOWKX81kjrUI+1qkY+SFRqDQg718iU3k016G8ZBcAwJnc/zjXbMjhr833epVcDRbKhf3RveN1v8X130RvTDeW6RiE+BULa7eUcu5eTah85gO1KT3EsFUVqQzhsEi0qX78wEVwk5Z9st0dKt3Thll7Do7GbL7fcO2yMWu7dag9iLPDUcNQAl4+pxavaNPpq

On Tue, 16 Sep 2025 16:30:30 -0700
Kees Cook <kees@kernel.org> wrote:

> Perhaps the issue is to just over-explain when the LLM is in use for
> now, and we (as a developer community) will collectively figure out what
> turns out to be unimportant or redundant over time. But this can't be
> done with a trailer tag: we're going to need relatively verbose notes
> in the commit log.

Do we need that much notes in the change log? Really, I think the only time
it is an issue is if AI wrote any non-trivial code. And what I mean by
non-trivial, it is pretty much anything other than auto complete.

But if it was used in tooling that doesn't show up in the actual patch, I
don't think it needs to be mentioned unless the developer wants to share
how they came up with the code.

For example, if I run spatch on code and it finds issues, and I fix it. I
may mention "this was found via spatch". But I don't go into too much
details. If you say "X LLM discovered this",  that would be nice, but I
don't think it is mandatory.

-- Steve

