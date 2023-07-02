Return-Path: <ksummit+bounces-947-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72E744DB2
	for <lists@lfdr.de>; Sun,  2 Jul 2023 15:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C251C2089C
	for <lists@lfdr.de>; Sun,  2 Jul 2023 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7072101;
	Sun,  2 Jul 2023 13:18:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277C1C02
	for <ksummit@lists.linux.dev>; Sun,  2 Jul 2023 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1688303907;
	bh=rXAjkP9ev5tEl8RY9ZrUCIA+GRI6LBybyEg0diB+gr4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RlReDFLfBWJnrpkKEHwvkDfUrkjwnJHOvhBSchpRVA4Q054ACjPyZ+vovOQdIVJ70
	 eEoE45Dv7RhRqPCNDG/z1iC0+OFdeiR0Yikox0po9SgqiRGuaQ3/TVPfI6DFa+avSY
	 DsnOO36Ui8dkp9gMG+XehfXIcONY2NWght+RwRLM=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 73BFD128605A;
	Sun,  2 Jul 2023 09:18:27 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id YiKyATTxErUe; Sun,  2 Jul 2023 09:18:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1688303907;
	bh=rXAjkP9ev5tEl8RY9ZrUCIA+GRI6LBybyEg0diB+gr4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RlReDFLfBWJnrpkKEHwvkDfUrkjwnJHOvhBSchpRVA4Q054ACjPyZ+vovOQdIVJ70
	 eEoE45Dv7RhRqPCNDG/z1iC0+OFdeiR0Yikox0po9SgqiRGuaQ3/TVPfI6DFa+avSY
	 DsnOO36Ui8dkp9gMG+XehfXIcONY2NWght+RwRLM=
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 99FE91286058;
	Sun,  2 Jul 2023 09:18:26 -0400 (EDT)
Message-ID: <ca41003023c9d78a4a12f94ae0b8b4fadd179dc0.camel@HansenPartnership.com>
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>, 
	ksummit@lists.linux.dev
Date: Sun, 02 Jul 2023 09:18:23 -0400
In-Reply-To: <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
	 <87y1k2kl5a.fsf@meer.lwn.net>
	 <20230701214603.6d0b299b@rorschach.local.home>
	 <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2023-07-01 at 21:56 -0700, Linus Torvalds wrote:
> We still have things like the aic7xxx scsi assembler thing that we do
> *not* make people build, and so we have shipped pre-built version of
> things like that.

The important point there is that the tool is in the tree, so everyone
uses the same version and gets the same output, so the output we check
into the tree is effectively universal.  Plus the tool has been
bitrotting quietly over the years, so what we have is more for
historical completeness now.

James


