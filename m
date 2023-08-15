Return-Path: <ksummit+bounces-965-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0477CA68
	for <lists@lfdr.de>; Tue, 15 Aug 2023 11:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC2E281452
	for <lists@lfdr.de>; Tue, 15 Aug 2023 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAFB100C6;
	Tue, 15 Aug 2023 09:28:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9623CC
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 09:28:52 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 12BEC21910
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1692091725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=e4HLP7NT9O2AaI2Npwv5WbH6tfQlBjy5auE+70z87Pk=;
	b=WTRzCkobZ78SKJM2ZkxdgD6tA5fPgBATX7DGMrB3JKGRhF187iTt7vEKbUGpkhta65DXLp
	lw8Pyg/HgJe9A5T2aN1QlXe5vNKu+oSonFJ18SPe5nOE/jIDB6Uve9QyZ0ZOfvBQThFReE
	TwMv0gY8eWg5WRx6IIsQ/jg1GcjirsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1692091725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=e4HLP7NT9O2AaI2Npwv5WbH6tfQlBjy5auE+70z87Pk=;
	b=EuHFl7UQ10dG9jAN652atz8/d/6iq8dx4cFRjOL9GHyZktvzLbhx8yNFkFCFE6p3Xnl+sT
	+JyKSnZFqkcF8jDw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 01FE22C143
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 09:28:44 +0000 (UTC)
Date: Tue, 15 Aug 2023 11:28:44 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

I believe that reporters of embargoed security issues have always been 
confused about reporting to security@kernel.org vs. reporting to 
linux-distros@, as those two lists have completely different ways of 
dealing with the report (different purpose, different deadlines, different 
obligations imposed on the reporters, etc).

Our documentation originally suggested reporting to both in some "hybrid" 
mode, and the results were not great, quite often leading to confusion 
left and right.

This led to a slight update to our documentation [1], where reporters are 
discouraged from reporting kernel issues to linux-distros@ ever.

While I generally agree with the change *now*, given the current 
conditions, I would like to bring this up for discussion on how to deal 
with this longer term.

With my distro hat on, I really want the kernel security bugs to be 
*eventually* processed through linux-distros@ somehow, for one sole 
reason: it means that our distro security people will be aware of it, 
track it internally, and keep an eye on the fix being ported to all of our 
codestreams. This is exactly how this is done for all other packages.

I would be curious to hear about this from other distros, but I sort of 
expect that they would agree.

If this process doesn't happen, many kernel security (with CVE potentially 
eventually assigned retroactively) fixes will go by unnoticed, as distro 
kernel people will never be explicitly made aware of them, and distros 
will be missing many of the patches. Which I don't think is a desired end 
effect.

I have been discussing this with Greg already some time ago, and I know 
that his response to this is "then use -stable, and you'll get everything 
automatically" (which is obviously true, because stable is represented at 
security@kernel.org), but:

- Neither us (nor RedHat, nor Ubuntu, as far as I am aware) are picking 
  stable as a primary base for distro kernels. There are many reasons for 
  this (lifecycles not matching, stable picking up way too many things for 
  taste of some of us, etc), but that's probably slightly off-topic for 
  this discussion

- For several varying reasons, our security people really struggle with 
  ensuring that whenever CVE is published, we as a distro can guarantee,
  that fix for that particular CVE is included. linux-distros@ provides
  that connection between bugfix and CVE report, and that is lost if the 
  fix goes only through security@kernel.org

  And yes, I hate the whole CVE thing with passion, but it unfortunately 
  exists and is seen as an industry standard by many. And with us not 
  being able to systematically / automatically guarantee that fix for 
  particulart CVE is included, Linux will be not allowed into many places.

I am currently not sure what exactly would be the solution to this.

One thing to try would of course be to discuss with linux-distros@ people 
whether they'd be willing to adjust their rules to fit our needs better; 
but before that happens, we should be ourselves clear on what our needs 
towards them actually are.

Another option might be to ensure representation of distros at 
security@kernel.org, but that would completely change the purpose of it, 
and I don't think that's desired.

... ?

[1] https://git.kernel.org/linus/4fee0915e649b

Thanks,

-- 
Jiri Kosina
Director, SUSE Labs Core

