Return-Path: <ksummit+bounces-2213-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943EB32143
	for <lists@lfdr.de>; Fri, 22 Aug 2025 19:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1248E1D62461
	for <lists@lfdr.de>; Fri, 22 Aug 2025 17:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C20313539;
	Fri, 22 Aug 2025 17:10:28 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915F2472A5
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882627; cv=none; b=jEra/lq3hurlb18LqmP37uqTCUVNvxIA80ZKeQOlPFgqz9H/C4Ol+Im7A8JIqRRJCCwgMXWOToADJ+RuudvvdM0SCTPWRw3525gOu7F1H5aHlnKrUGQ4xi71pkDL0BDXB2x9MmGa231+2CZQ7PTJUfW77KAjHbVO4YqkfONd/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882627; c=relaxed/simple;
	bh=gkZR9G6KB3o9Lupd9KgFDu01r/r3L2/MnbsG9ePHVB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4Csn0zuDlmLdwVwiJZ6Bg5ldMcWdBKkUk08g4Kr9uNvyQDfmQn1Hzoyo5DGRK5zxNNJoe+4BQlPKVj+ekC4GXR3mDuTiLNRhqGAxIVbirb6127bv32PQ6hYzx85JzvXEpOYKXYvllW/gl43IMm0KzKgjpbojIr1mprH3vuBQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 5736EB7A90;
	Fri, 22 Aug 2025 17:10:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 3CDD26000F;
	Fri, 22 Aug 2025 17:10:16 +0000 (UTC)
Date: Fri, 22 Aug 2025 13:10:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: YoungJun Park <youngjun.park@lge.com>, ksummit@lists.linux.dev,
 chrisl@kernel.org, gunho.lee@lge.com, taejoon.song@lge.com,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <20250822131022.4df59a60@gandalf.local.home>
In-Reply-To: <aKihqI8PWLFL1b5i@casper.infradead.org>
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
	<aKihqI8PWLFL1b5i@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3CDD26000F
X-Stat-Signature: 3ner7djk134re1acgt91ifnpokgqdxhi
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19LWSoxWBbW+ZtdStBOczpzKGU7lR8YkQU=
X-HE-Tag: 1755882616-508620
X-HE-Meta: U2FsdGVkX1/ulOwYB5xVWtXm0MAwONwqumRc8x8A18URrWHtS+u2SgBpr1PuG7HI6bLcwev9pHrvj43UHdexy9Fg9Wr36c+zB2u8KmqQlvd1SecK9oNXA8cgwKcBLphDbNwy+qVLtOi0r+7zoKHXswj5iZ/jGlQwa7om9oprPL1RWNIisQq3VY77TERSiU66Yfnyo6woojcuLvWcrI8QZg1KFRm9Wslyvv/KFBOFr/9dqIf5/0WHWZzz6ZxxGpFiX8lmgz0nV51Y0FgsA2ARlsWD4N6CHMfE7kqFEnmM+NE6a/UkZg4ASS+jcjEFTq1JSjkbVlxOC/0tjTZ8zgaD13Mk2pJvwEuD0Uf1Prb5ldGi9J25A2KBNc3hQiUvBIXcdFT9+2fV60So4eVe5/IqzAA0brV1cvXXVsNgb7/xxsZ9/gpQ9QWRBlmJRMzP8iS7Nk5Ssy0eff4EuAczA5X8LJxH5NTlOVTTay0nJFkOpOk=

On Fri, 22 Aug 2025 17:58:16 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> > Proposal:
> > I am developing on a restricted internal platform where there is a
> > technical requirement to use idle devices as extended memory. =20
>=20
> I don't think this is appropriate for the maintainer summit.  You
> can submit it to the Plumbers MM microconf [1] or LSFMM in May.
>=20
> [1] https://lpc.events/event/19/contributions/1995/
>=20
> Also you should have cc'd linux-mm for this kind of thing, adding
> it now.  Preserving the rest of the proposal for those who are
> interested.

=46rom Ted's original email: https://lore.kernel.org/all/20250805144357.GA762=
104@mit.edu/

  Related to the Maintainer's Summit, the Kernel Summit is organized as a
  track which is run in parallel with the other tracks at the Linux
  Plumbers Conference (LPC), and is open to all registered attendees of
  LPC.  The goal of the Kernel Summit track will be to provide a forum to
  discuss specific technical issues that would be easier to resolve in
  person than over e-mail.  The program committee will also consider
  "information sharing" topics if they are clearly of interest to the wider
  development community (i.e., advanced training in topics that would be
  useful to kernel developers).

  To suggest a topic for the Kernel Summit, please do two things. by
  September 10th, 2025. First, please send e-mail with a subject prefix of
  [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a
  separate e-mail for each topic.

So this appears to be appropriate.

-- Steve

