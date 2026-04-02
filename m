Return-Path: <ksummit+bounces-2905-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEZDChp6zmmMnwYAu9opvQ
	(envelope-from <ksummit+bounces-2905-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:15:54 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783638A53F
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7015B3058550
	for <lists@lfdr.de>; Thu,  2 Apr 2026 14:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320A43E8C42;
	Thu,  2 Apr 2026 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="YMPYnDwr"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511943E92A0
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138972; cv=none; b=nggkDF4abOvSrYEcciNtXNR5CCFP2P9gJTwbTeOSfN4vv63v0n3bRRvKqxB/NR8s44lYuxac2lDYk7WKE4GGFTriS/iHSmEVIzKh7EX9wMpXmX+bssVlh3l+EaqYdKP8BzQl80MhE3INqT85RIe/Yj2kXQBmWcHsP5KKsQkXdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138972; c=relaxed/simple;
	bh=6IDK6pLoBySTKvzJB0eNtn5BbM6wOjGC+wBzDyThcIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6SQ7L9cv8Fpal/A0GAp/U3G/H7av2BEXhHth1JTuBV5ik2AAzYGAuu625YXXmN8GU70pco50BJkDUU/VAWORG1wi0UbUZPK/9hFzPbUfYNPqV2qmx5hpxw8mtuemdLK8Pd4qxfbfDCGkZE+IQ6w7z7LMRlIgt/hsGkUfVQYHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=YMPYnDwr; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org (pool-173-48-112-174.bstnma.fios.verizon.net [173.48.112.174])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 632E9NUm015836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Apr 2026 10:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1775138965; bh=z63gYh/qPVJw4SL/t0XkRoi+ryICDJiBG3QV9HMcrw8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=YMPYnDwrsycfDT5fzJNZHGMtcVZuHyLSDvE936PY2JmWwtrilZIm9HW0sd9xih9n9
	 +u9CXE9iH3RJHjjuLMJFhSqQACbciNE/eDcMqC8qAmo5x/3YHJDLj5gcjrlqG+zoQ4
	 9cAvjR5j7p5I8E6WYyTjRNiYndt+txYq5oQOhdZg6Vm9o7K34v+Dcitu6a1OcvvJVG
	 mh9BlCLXNr5UaDfoN6AAiCUwp8ymsKCjowRUdIpBwX+ZKzDBwJDTvnQ/YWOdexT4fc
	 8HljbDzzYIZWrosou49FR5LLPBmicSD/vbErJXZdlMcu5l0P68FpcKLkGX1qTCkfMO
	 s+QCQpJVfDuAQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id DFB7260DA1E3; Thu,  2 Apr 2026 10:08:22 -0400 (EDT)
Date: Thu, 2 Apr 2026 10:08:22 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, users@kernel.org,
        ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260402140822.GG15407@macsyma-wired.lan>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
 <20260402130706.GA15407@macsyma-wired.lan>
 <20260402-complex-ultraviolet-limpet-aea0bc@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-complex-ultraviolet-limpet-aea0bc@lemur>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mit.edu,none];
	R_DKIM_ALLOW(-0.20)[mit.edu:s=outgoing];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2905-lists=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mit.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 7783638A53F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 09:28:58AM -0400, Konstantin Ryabitsev wrote:
> 
> Right, let me clarify this. I don't expect that we'd be keeping *any* kernel
> bugs in torvalds/linux.git. Kernel development happens on a subsystem level
> and especially bugs are rarely relevant across the tree, so, in my mind, bug
> tracking would be done per-subsystem. They can either use their own fork of
> the kernel for this, or they can use a dedicated repo just for bugs.

That makes sense.  Are you thinking that there might be some public
interface that might allow users to search across all known and public
big-tracking repositories to try to find "known issues"?

> That's actually the whole point. Only subsystem maintainers would be able to
> create a bug. To *report* a bug, the reporter would use an ingestion frontend
> as I described -- bugs.kernel.org or similar that would pre-analyze the bug,
> create a bug report and *then* send the report to maintainers. A bug report
> doesn't automatically become a tracked bug in git-bug unless the maintainer
> then imports that report into their bug-tracker.

If users have additional information that they contribute in response
to clarifying questions from the maintainer, that would be tracked via
an e-mail thread from lore.kernel.org, and it would be optional if the
maintainer wanted to ingest some additional data that might be useful
from the bug tracking perspective into the repo?   Is that the idea?

Thanks,

						- Ted

