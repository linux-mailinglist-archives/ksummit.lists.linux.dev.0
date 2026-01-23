Return-Path: <ksummit+bounces-2806-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGZ6JzHBc2mjyQAAu9opvQ
	(envelope-from <ksummit+bounces-2806-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 19:42:57 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214279BC9
	for <lists@lfdr.de>; Fri, 23 Jan 2026 19:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B203305D387
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581C7248886;
	Fri, 23 Jan 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OeGiPfGk"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F11DC9B3
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193771; cv=none; b=fCj+9FF4w7Q4blJHnBSPsiHVfodDRFzLfkV9qe/N+U1Fxo1JW6x0WvsEzpwEb8zpnwd9juUX0/5/vxvlpkGQSz8p0YE+ml6Rruf2KQ72RcbgkhcdyLFSFmJeskT/kEcXPXOhemS8kX+asOXBgyL+MDExk13jLvJtvfslNTG1xZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193771; c=relaxed/simple;
	bh=vTBZ/ZMcenH149UaTuwyytmiBaTw9kOcGxn0NdEJ8tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WHsl5EUmUZUSaxQI5Wq+pmYZXZnieGzlHSjoOuFoz2U0HWRf7z8z6Db9DEScw+SJzFEbDIjb2Za8lvMzGO2J+p+7hEVQyRckQS5fGkg+kCnB8fbnc+8lkk3vWp8WXuR9tNYOsVw+XXkaATaTh/eaYkOCh+EjXxxO24eb2eLkmzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OeGiPfGk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=BFLJhNDmvNe4jUxfiZcJ0BIanw1yQbNMiv7iaE4yBaU=; b=OeGiPfGkwdzmpkvEu7RI8lxgSw
	10ZzeAQbvn/z89k1PkKlmHieyORvpAH8IuzN7UJ866SAoK2NX9txcjJw0yHhuyF3ZalqwTEt/kv1i
	g6IPwSKwTZvX4uQ3monY8srXa7HIipsSaA5D9xHeORbe5HsLn9cSA6y7ONNgUVLyhMn+itvA32RNz
	yG9LmTwev/5yklKdln5ORXyov7ZrOiiin5ggyGAw1ykSrAjht0nnXAteVCtaLnDLpghAK8vJkXf+2
	xcjG8EQ6RVZnwUVsA0tt59NzFk++5M4edNV3uuhZeBThUDCGCjNFv6vwxmWPpxuzLJFxsIpVlwF6s
	A5NdKYVw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM7M-00000009MYL-0XyW;
	Fri, 23 Jan 2026 18:42:48 +0000
Message-ID: <8f604dad-2021-4685-9be8-72cbe68f5ecd@infradead.org>
Date: Fri, 23 Jan 2026 10:42:47 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel.org tooling update
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251209-roaring-hidden-alligator-068eea@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-2806-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,ksummit@lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0214279BC9
X-Rspamd-Action: no action

Hi,

On 12/9/25 8:48 PM, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> These are the topics that were touched on at the maintainer summit when
> discussing tooling on the kernel.org side of things.
> 
> --
> 
> # What is the state of tooling?
> 
> ## b4 development update
> 
> Past year:
> 
> - No major new features in b4 over the past year, excepting `b4 dig`
> - Seeing lots of adoption and use across subsystem, with a lot of maintainers
>   recommending b4 as the preferred mechanism to submit patches
> - Starting to see adoption by several non-kernel projects (openembedded, u-boot, others)
> - Significant behind-the-scenes move of codebase to stricter typed code
> - Continued work on `b4 review` that got shelved temporarily for other
>   priorities.
> 
> ### LETS PUT MOAR AI INTO IT!!1
> 
> I spent a lot of time on trying to integrate AI into b4 workflows, but with
> little to show for it in the end due to lackluster results.
> 
> - Used local ollama as opposed to proprietary services, with the goal to avoid
>   introducing hard dependencies on third-party commercial tooling. This is
>   probably the main reason why my results were not so exciting as what others
>   see with much more powerful models.
> 
> - Focused on thread/series summarization features as opposed to code analysis:
> 
>     - Summarize follow-ups (trailers, acks/nacks received), though this is
>       already fairly well-handed with non-AI tooling.
> 
>     - Gauge "temperature" of the discussion to highlight controversial series.
> 
>     - Gauge quality of the submission; help decide "is this series worth
>       looking at" before maintainers spend their effort looking at it, using
>       maintainer-tailored prompts. This may be better done via CI/patchwork
>       integration, than with b4.
> 
>     - Use LLM to prepare a merge commit message using the cover letter and
>       summarizing the patches.
> 
> I did not end up releasing any features based on that work, because:
> 
>     - LLM was not fantastic at following discussions and keeping a clear
>       picture of who said what, which is kind of crucial for maintainer
>       decision making.
> 
>     - Very large series and huge threads run out fo context window, which
>       causes the LLM to get even worse at "who said what" (and it's
>       already not that great at it).
> 
>     - Thread analysis requires lots of VRAM and a modern graphics card, and is
>       still fairly slow there (I used a fairly powerful GeForce RTX).
> 
>     - Actual code review is best if it happens post-apply in a temporary
>       workdir or a temporary branch, so the agent can see the change in the
>       context of the git tree and the entire codebase, not just the context
>       lines of the patch itself.
> 
> I did have much better success when I worked to represent a thread not as
> multiple messages, but as a single document with all interleaved follow-up
> conversations collated together. However, this was done manually --
> representing emails from arbitrary threads as such collated documents is a
> separate challenge.
> 
> Using proprietary models and remote services will probably show better
> results, but I did not have the funds or the inkling to do it (plus see the
> concern for third-party commercial tooling). I may need to collaborate more
> closely with the maintainers already doing it on their own instead of
> continuing my separate work on it.
> 
> ### AI crawler scourge
> 
> While working on LLM integration, it was certainly ironic that one of the
> top challenges for us was to try to keep AI crawlers from overwhelming
> kernel.org infrastructure. While we've put several mitigations in place, it's
> a temporary relief at best.
> 
> ## Continuous degradation of SMTP
> 
> We're increasingly having to deal with the degradation of the SMTP support by
> all commercial companies:
> 
>     - major hosts are increasingly not interested in getting mail from anyone
>       who isn't also a major mail service provider
> 
>     - their "bulk sender" guidelines are no good for us (e.g. requiring that
>       we add one-click unsubscribe footers to all email)
> 
>     - their "spam filters" are increasingly based on training data, which
>       means that "looks different from what most of our users receive" is
>       enough to have patches and code discussions put into the "Junk" folder
> 
>     - they apply arbitrary throttling ("too many deliveries for the same
>       message-id", "too many messages from the DKIM domain foobar.com")
> 
>     - anti-phishing services at commercial IT companies do horrible things to
>       incoming messages
> 
> ## Are we finally moving away from patches sent over email?
> 
> There are still important concerns when we consider moving away from "patches
> sent via email":
> 
>     - SMTP is still the only widely used protocol we have for decentralized
>       communication; everything else is experimental or has important
>       drawbacks, such as:
> 
>         - it relies on single-point-of-failure services (e.g. Signal), or
>         - it requires standing up esoteric software (which then become
>           single-point-of-failure services), or
>         - it requires an "everyone-must-switch-now" flag day
> 
>     - RFC-5322, with all its warts, is a well-defined standard for internet
>       messages:
> 
>         - robust, capable of dealing with change while preserving legacy
>         - easy to parse with libraries for almost any framework
>         - easy to archive and query
>         - has lots of tooling built around it
> 
> With lore and public-inbox, we *are* in the process of moving away from
> relying on the increasingly unreliable SMTP layer. Lore can already let you do
> the following things:
> 
>     - lets anyone submit patches via the web endpoint
>     - lets anyone subscribe to lists via several protocols (NNTP, POP, IMAP)
>     - lets anyone use lei to receive arbitrary feeds
>     - can aggregate any number of sources, as long as they are RFC-5322
>       messages (or can be converted to them)
> 
> Lore and public-inbox is becoming a kind of a distributed, replicating
> messaging bus with a robust query and retrieval interface on top of it, and I
> believe it's a fairly powerful framework we can build upon.
> 
> ## Work on "local lore"
> 
> One downside of lore.kernel.org is that it's a central service, which runs
> counter to our goal of limiting how many single points of failure we have.
> There is fault-tolerance built into the system (lore.kernel.org is actually 4
> different nodes in various parts of the world), but an adversary would have no
> difficulty knocking out all nodes at once, which would impact the project
> significantly.
> 
> The "local lore" projects it the attempt to provide a kind of "maintainer
> container" that can be run locally or in any public cloud:
> 
>     - comes with a 6-month constantly-updating mirror of lore, using a
>       failover set of replication URLs (including tor/onion)
>     - comes with a pre-configured mirror of git repositories that are kept
>       up-to-date in the same fashion
>     - lets the maintainer set up lei queries that can push into their
>       inbox, supporting Gmail+OAuth, JMAP, IMAP
>     - provides a web submission endpoint and an SMTP service that can
>       integrate with other SMTP relays
>     - publishes a public-inbox feed of maintainer activity that central
>       lore can pick up and integrate
> 
> There is a parallel goal here, which is to make it easier for devs to assume
> maintainer duties without having to spend a week setting up their tooling.
> In theory, all they would be need to do is to set up their maintainer
> container and then use the web menu to choose which feeds they want to pull
> and where they want messages delivered.
> 
> This project is still early in development, but I hope to be able to provide
> test containers soon that people can set up and run.
> 
> ## Other tools
> 
> ### Bugzilla
> 
> It may be time to kill bugzilla:
> 
>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>       active
>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>       5.2 development branch and continuing with 5.1
>     - question remains with what to replace bugzilla, but it's a longer
>       discussion topic that I don't want to raise here; it may be a job for
>       the bugspray bot that can extend the two-way bridge functionality to
>       multiple bug tracker frameworks
> 
> ### Patchwork
> 
> Patchwork continues to be used widely:
> 
>     - we've introduced query-based patchworks, where instead of consuming the
>       entire mailing list, we feed it the results of lei queries
>     - I'm hoping to work with upstream to add a couple of features that would
>       be of benefit to us, such as:
> 
>         - support for annotating patches and series (e.g. with LLM summaries)
>         - an API endpoint to submit patches, so maintainers could add
>           arbitrary series to their patchwork project, integrating with b4
> 
> ## Web of Trust work
> 
> There is an ongoing work to replace our home-grown web of trust solution (that
> does work but has important bottlenecks and scaling limitations) with
> something both more distributed and easier to maintain. We're working with
> OpenSSF to design the framework and I hope to present it to the community in
> the next few months.
> 
> ## Questions?
> 
> Send away!

Was any of this discussed at the December summits?
Were there any decisions or conclusions?
Are they summarized and shared somewhere?

Thanks.
-- 
~Randy


