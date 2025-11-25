Return-Path: <ksummit+bounces-2647-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DCC85DC7
	for <lists@lfdr.de>; Tue, 25 Nov 2025 17:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8F254E61F7
	for <lists@lfdr.de>; Tue, 25 Nov 2025 16:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78F422424E;
	Tue, 25 Nov 2025 16:04:16 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576B2147E5
	for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086656; cv=none; b=KOxJ7m/oixA6We7stg3400AUywLWbpnogUvklX3XoMY5GBXY8sepXgnzWBxaEsjmPSJ2tt+62786anWqD88bDyFp/FWDz7EXB7jnI7sDSfs3rrQxHZ7jOa8CJ8SoxlYtSzt1yRO3cs8agC9nzpelf3yzJutlUYRlm0kqjVHrZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086656; c=relaxed/simple;
	bh=P5U5/ctSh1yRorgZEQtcTI8QGPrR0dHI+POy0v4SJV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktYEPZ2Ho06J+5lFf0pIjEn8539j8RZvGLE/99dxN6aMwWjhrQLGP9zqKMCp98ckqlBHnN3VuagGcAydKLxuJWqSlK8L/cxtQ43zAr/EvUzoRC0qg4zmd4JdROl6f1gutSrrnZkf1V2W00aqoSqtG5hPDfzNVb19ksYgKiFB43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 4686857F20;
	Tue, 25 Nov 2025 16:04:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 5139F41;
	Tue, 25 Nov 2025 16:04:05 +0000 (UTC)
Date: Tue, 25 Nov 2025 11:04:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251125110448.5ff112ea@gandalf.local.home>
In-Reply-To: <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5139F41
X-Stat-Signature: jcdczobagcdh6r3rz18dwdqhgzxgs4z9
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+Yw8NVqr+WpJ4tLw96XxB4Q9ivnmx8tK4=
X-HE-Tag: 1764086645-613672
X-HE-Meta: U2FsdGVkX19YKn4VTQvrL9M0GxhHbdjPTRwaMR++Ot/RpetKY1i5W3a6QSksZscQhDLbj9rzoX1/i8pQ5Cw9THSsVCPcpb2rJGzbDra/p8e2kF6qSdzx2v7WYtRf/EHUM0mQBg+/Mrg+7ZqbojFPat6Zb4mjwfQBv4jhNfWIAIl+bt4AzjXl7DORq3MKd/LHy6Vv+IL4uAhHEYwC7B78DXSl9pkq0R/dGoVzcCQo5OgnIQKjC7EeCoHxgaGuHCQgdmSPfNoETgshpa0w1JFzOfUzxv0Ih0wR5Q3NfWktfCAaMSStySoIV5PoEznxdAOeJd+L0ZtUVZfGACKQuFwTvdhE1Hw2tWFOO4F2C8KjgXIPtj/m9q5ni1dtjwQnRHBgRw1EVygu1Jg=

On Tue, 25 Nov 2025 17:25:19 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> C89 style provokes substyles(!) which makes adding new variables even
> more obnoxious: some subsystems have(had?) a rule saying that declarations
> (with initializers) must be sorted by length, so not only programmer has
> to PageUp to the beginning of the block, but then aim carefully and
> insert new declaration.

As one of the subsystem maintainers that enforce the "order by length"
rule, I'm also for making more exceptions to the c89 method. The reason we
do the "order by length" is for aesthetic reasons, as nicer looking code is
easier to read. If there's a rule to have all declarations at the top, at
least make it pretty!

But yeah, perhaps if we didn't have a strict enforcement of declaring
everything at the top, we wouldn't have bugs like this:

  https://lore.kernel.org/all/20251125032630.8746-3-piliu@redhat.com/

-- Steve

