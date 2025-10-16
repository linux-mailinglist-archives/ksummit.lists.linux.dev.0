Return-Path: <ksummit+bounces-2560-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B65BE3CA8
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CE1F355A3D
	for <lists@lfdr.de>; Thu, 16 Oct 2025 13:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B9B33A01D;
	Thu, 16 Oct 2025 13:47:31 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0362E6135
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622451; cv=none; b=MA1BDY4IdZACVpcy1By5JjwIAoQYg54RjX5Um96XmdekSXlKAt5kvCLUtUj83yXY/GQR0RAKkmr4deUPISlq3rRzaHXmCV+wsDQcPjG/YunI604zU+Gp7sqch15ogv66QZQ5qdoPsEkGFHDfnkSDUPSCYvsQl95vxrC6CRdogKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622451; c=relaxed/simple;
	bh=y0W1N6r8qjO593i0xXMICg8Kg+MzZUZ8PhcAS0aX+qM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OJtlMpQmsHsx13iKFpGv0FVQZkuydZYTQ7Tp5+I8x6lMUyyA/wGag78Fpz/7c67NP5eMc0bRBQRyrOZE7pcUD227ogb4fLuNo8nf1Z9h8G4GwxMrr4GzOYL05f+QyAl1QYoyo/JZz90K7XcaYmbXqeEy8ClOsaOazK6pIRQxRxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 18BEE13A915;
	Thu, 16 Oct 2025 13:47:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id D2A7320025;
	Thu, 16 Oct 2025 13:47:24 +0000 (UTC)
Date: Thu, 16 Oct 2025 09:47:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, dan.j.williams@intel.com, Doug Anderson
 <dianders@chromium.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016094734.27f4fff8@gandalf.local.home>
In-Reply-To: <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
	<2025101448-overtake-mortality-99c8@gregkh>
	<68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
	<20251015-versed-active-silkworm-bb87bd@lemur>
	<CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
	<CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
	<2025101631-foyer-wages-8458@gregkh>
	<892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
	<2025101639-thwarting-press-f0f7@gregkh>
	<ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>
	<20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
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
X-Rspamd-Queue-Id: D2A7320025
X-Stat-Signature: zy9q9rwxid8fqfe61enunbzf4m6dbmi9
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX185MxM3PtVYf8IiytJ3khPbJd3YO1l2Alk=
X-HE-Tag: 1760622444-522591
X-HE-Meta: U2FsdGVkX19Se/eMqHdb0nW2OYRy5OKKHFdh/hf/3WpEkA8qkEnM05ZWkuWW7pAl09ABCd1vt25wpAy3n4nmgf5Ux2+nYhfJWBq0Nz47Fh8vNaYTbkRm4y0FyeNnbxXez5VI3SjwrkpW6NWCsqUp+aegUA/ysvmBKbDhm+fgNvewsvG+qUVS3UD0PBKIaMykjz3nA5UyGj0EgoJ0AujcTW/Xot0KOo6gBpUnAeJgtel0YbQsjoAGhxEs2W7WytS61nU7lcf3p+MXK1OYxsQLfaaVzho9HJfl98l5V3czku4xkZ534rjZzNSuhc9P1cNlOZxHgeNuq56jETPpCWmbkAbz9VLnI4htu0ChmFdBLhGItR4AYuujnPj2yyd3KFmbAAQAQcxgzI22G7LqLn9VZbFucE6+UmYyH3FUrxQNC5KGDOOvx5YlzM8DqJBu88xcLwDm4BEBKswwhdXHN7KGwsDDmC6JUjPHfkrDQpTRj1eNXApIc+DrCXjIOlRjmXW68XoAvCe0INBytIqDlwm3UJKccPh1Aw9uen7EKZFZyj8NJl9qWdHIMym2eJQTaua3d/craUxh7wqpBAK4ZbxDgEhpXMzZb0dWDz15BGX+aRnaNJbTtkl6f2ZEaJm5x2QVZ98KpH2q8yCdmcY9MjLNAu1iehsKfGYZYEL1ZFOk/PwUGI1pStoZKhw8cfTe80RNby3HY7Xmc5VF61DdhN23Z8s1FqadQM7j4GKgPIvEk2/9pfJ+u0QDYv3PRoDTRNcO

On Thu, 16 Oct 2025 09:00:49 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> I am wholeheartedly for this approach. One of the downsides of the current
> scheme is that Link: trailers can be pointing at multiple patch submissions
> (e.g. if the commit wants to highlight a related patch series), so without a
> clear indication which link is the provenance link, we still have potential
> for confusion.

I started to separate out "Link:" that was meaningful to the conversation
from "Link:" that was a patch submission, not by the URL but by having the
meaningful ones outside of the tags section. As to me, if it is for human
consumption, it shouldn't be part of the tags.

For example:

    tracing: Have eprobes have their own config option
    
    Eprobes were added in 5.15 and were selected whenever any of the other
    probe events were selected. If kprobe events were enabled (which it is by
    default if kprobes are enabled) it would enable eprobe events as well. The
    same for uprobes and fprobes.
    
    Have eprobes have its own config and it gets enabled by default if tracing
    is enabled.
    
    Link: https://lore.kernel.org/all/20250729102636.b7cce553e7cc263722b12365@kernel.org/
    
    Cc: Mark Rutland <mark.rutland@arm.com>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Cc: Jonathan Corbet <corbet@lwn.net>
    Cc: Randy Dunlap <rdunlap@infradead.org>
    Link: https://lore.kernel.org/20250730140945.360286733@kernel.org
    Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
    Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

That first link is the reason for the patch, whereas the one in the tags
links back to the patch itself and was automated. If there was a discussion
during the patch submission, I don't separate it. As that would take extra
work ;-)

-- Steve

